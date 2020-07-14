require_relative './jokes'

class JokeMessage
  attr_accessor :bot, :message, :joke

  def initialize(bot:, message:)
    self.bot = bot
    self.message = message
  end

  def send_response
    bot.api.send_message(chat_id: message.chat.id, text: "What's your name?")
    bot.listen do |name|
      if name
        @joke = Jokes.new.random_joke(name.text)
        break
      end
    end
    bot.api.send_message(chat_id: message.chat.id, text: @joke.to_s)
  end
end