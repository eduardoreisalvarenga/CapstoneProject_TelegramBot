require 'telegram/bot'
require 'dotenv'

require_relative '../lib/message_handler'

class MyRubyBot
  def main_method(token)
    @id_array = []
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        @id_array.push(message.chat.id) unless @id_array.include?(message.chat.id)
        MessageHandler.new(bot: bot, message: message).handle_message
      end
    end
  end
end
Dotenv.load
token = ENV['API_KEY']
MyRubyBot.new.main_method(token)