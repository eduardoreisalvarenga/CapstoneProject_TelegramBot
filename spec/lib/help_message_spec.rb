require_relative '../../lib/help_message'

describe HelpMessage do
  let(:bot) { double }
  let(:api) { double }
  let(:message) { double }

  it 'It mocks my telegram:bot' do
    bot_klass = double('Bot')
    allow(bot_klass).to receive(:bot).and_return("It's working")
    expect(bot_klass.bot).to eq("It's working")
  end 
  
  it 'fires a message' do 
    api_klass = double('Api')
    allow(api_klass).to receive(:api).and_return('type /help to see command list')
    expect(api_klass.api).to eq('type /help to see command list')
  end 
 
  it 'sends a joke' do 
    message_klass = double 
    allow(message_klass).to receive(:joke).and_return('joke sent')
    expect(message_klass.joke).to eq('joke sent')
  end 
end