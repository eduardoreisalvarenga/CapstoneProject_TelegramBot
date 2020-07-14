require_relative './quotes'

class QuoteMessage
  attr_accessor :bot, :message

  def initialize(bot:, message:)
    self.bot = bot
    self.message = message
  end

  def send_response
    quote, author = RandomQuote.new.get_quote!
    bot.api.send_message(chat_id: message.chat.id, text: "#{quote}\n\t- Author: #{author}")
  end
end
