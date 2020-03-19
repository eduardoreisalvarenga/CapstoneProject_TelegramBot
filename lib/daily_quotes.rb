require 'time'
require 'dotenv'
require_relative 'quotes'

class DailyQuotes
  def quote(id_array)
    t = Time.now
    hour = t.hour
    minutes = t.min
    if hour == 13 && minutes == 14
      Dotenv.load
      token = ENV["API_KEY"]
      Telegram::Bot::Client.run(token) do |bot|
        id_array.each do |element|
          quote, author = RandomQuote.new.get_quote!
          bot.api.send_message(chat_id: element, text: "#{quote}\n\t- Author: #{author}")
        end
      end
    end
  end
end
