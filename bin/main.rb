require 'telegram/bot'
require 'dotenv'
require_relative '../lib/jokes.rb'
require_relative '../lib/quotes.rb'

class Main
  def main_method
    Dotenv.load
    token = ENV["API_KEY"]

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
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
