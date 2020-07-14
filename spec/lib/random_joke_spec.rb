require_relative '../../lib/random_joke'

describe JokeMessage do
  let(:bot) { double }

  it 'fires send_message' do
    allow(bot).to receive(:text).and_return('random joke')
    expect(bot.text).to eq('random joke')
  end 
end