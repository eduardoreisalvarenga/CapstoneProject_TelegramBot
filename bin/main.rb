require 'telegram/bot'
require_relative '../lib/jokes.rb'
require_relative '../lib/daily_quotes.rb'
token = '1142941945:AAEJgRnZ9KTwspfSLmNpzu2waocJH1sji3M'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/quote'
      quote, author = DailyQuote.new.get_quote!
      bot.api.send_message(chat_id: message.chat.id, text: "#{quote}\n\t-Author: #{author}")
    when '/joke'
      bot.api.send_message(chat_id: message.chat.id, text: "What's your name?")
      bot.listen do |name|
        if name
          bot.api.send_message(chat_id: name.chat.id, text: name)
          @joke = Jokes.new.random_joke(name.text)
          break
        end
      end
      bot.api.send_message(chat_id: message.chat.id, text: "#{@joke}")
    end
  end
end
