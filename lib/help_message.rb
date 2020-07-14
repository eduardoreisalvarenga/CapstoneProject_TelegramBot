class HelpMessage
  attr_accessor :bot, :message

  def initialize(bot:, message:)
    self.bot = bot
    self.message = message
  end

  def send_response
    bot.api.send_message(chat_id: message.chat.id, text: 'Type /joke to receive a custom joke with your name')
    bot.api.send_message(chat_id: message.chat.id, text: 'Type /quote to receive an inspirational quote')
  end
end