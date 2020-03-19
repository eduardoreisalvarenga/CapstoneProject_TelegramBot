require 'telegram/bot'
require 'dotenv'
require_relative '../lib/jokes.rb'
require_relative '../lib/quotes.rb'
require_relative '../lib/daily_quotes.rb'

class Main
  def main_method
    Dotenv.load
    token = ENV["API_KEY"]
    id_array = []
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        id_array.push(message.chat.id) if !id_array.include?(message.chat.id)
        DailyQuotes.new.quote(id_array)
        case message.text
        when '/quote'
          quote, author = RandomQuote.new.get_quote!
          bot.api.send_message(chat_id: message.chat.id, text: "#{quote}\n\t- Author: #{author}")
        when '/joke'
          bot.api.send_message(chat_id: message.chat.id, text: "What's your name?")
          bot.listen do |name|
            if name
              @joke = Jokes.new.random_joke(name.text)
              break
            end
          end
          bot.api.send_message(chat_id: message.chat.id, text: "#{@joke}")
        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: "Type /joke to receive a custom joke with your name")
          bot.api.send_message(chat_id: message.chat.id, text: "Type /quote to receive an inspirational quote")
        end
      end
    end
  end
end

Main.new.main_method
