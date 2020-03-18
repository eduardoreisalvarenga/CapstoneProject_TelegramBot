require 'telegram/bot'
token = '1142941945:AAFsZUo0nYPoHf1IW1CHgTRTxVxgVgtMk7Y'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/quote'
      bot.api.send_message(chat_id: message.chat.id, text: "This is a quote")
    when '/joke'
      bot.api.send_message(chat_id: message.chat.id, text: "What's your name?")
      bot.api.send_message(chat_id: message.chat.id, text: "This is a joke with your name")
    end
  end
end
