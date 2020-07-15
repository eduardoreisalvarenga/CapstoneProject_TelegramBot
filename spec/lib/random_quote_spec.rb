require_relative '../../lib/random_quote'

describe QuoteMessage do
  let(:bot) { double }

  it 'fires random_quote' do
    allow(bot).to receive(:quote).and_return('random quote')
    expect(bot.quote).to eq('random quote')
  end
end
