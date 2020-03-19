require_relative '../lib/quotes.rb'

describe RandomQuote do
  it 'fetches a random quote from api' do
    expect(RandomQuote.new.get_quote!).to be_a(Array)
  end
end
