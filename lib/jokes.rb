require 'rest-client'
require 'json'

class Jokes
  def random_joke(name)
    url = 'https://api.chucknorris.io/jokes/random'
    resp = RestClient.get url
    joke = JSON.parse(resp.body)['value']
    joke = joke.gsub('Chuck Norris', name)
    random_joke(name) if !joke.include?(name) or joke.include? 'Chuck Norris'
    joke.to_s
  end
end