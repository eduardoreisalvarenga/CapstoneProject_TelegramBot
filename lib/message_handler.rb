require_relative './random_joke'
require_relative './random_quote'
require_relative './help_message'

class MessageHandler
  attr_accessor :bot, :message

  def initialize(bot:, message:)
    self.bot = bot
    self.message = message
  end

  def handle_message
    case message.text
    when '/quote'
      QuoteMessage.new(bot: bot, message: message).send_response
    when '/joke'
      joke_message = JokeMessage.new(bot: bot, message: message)
      joke_message.send_response
      @joke = joke_message.joke
    when '/help'
      HelpMessage.new(bot: bot, message: message).send_response
    end
  end
end
