require_relative '../../lib/message_handler'

describe MessageHandler do
  subject { described_class.new(bot: bot, message: message) }
  let(:bot) { double }
  let(:api) { double }

  context 'when quote' do
    let(:message) { double('message', text: '/quote') }
    let(:quote_message) { instance_double QuoteMessage }

    it 'fires QuoteMessage instance' do
      expect(QuoteMessage).to receive(:new).with(bot: bot, message: message).and_return quote_message
      expect(quote_message).to receive(:send_response)
      subject.handle_message
    end
  end
end
