require 'rest-client'
require 'json'

class RandomQuote
  attr_reader :resp, :quote, :author
  def get_quote!
    url = 'https://type.fit/api/quotes'
    resp = RestClient.get url
    sorted = rand(0..JSON.parse(resp.body).size)
    quote = JSON.parse(resp.body)[sorted]['text']
    author = JSON.parse(resp.body)[sorted]['author']
    [quote, author]
  end
end
