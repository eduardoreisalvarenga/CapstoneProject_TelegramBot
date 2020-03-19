require_relative '../lib/jokes.rb'

describe Jokes do
  it 'fetches a random joke from api' do
    expect(Jokes.new.random_joke('eduardo')).to be_a(String)
  end
end
