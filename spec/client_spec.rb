require_relative '../lib/client'

describe Client do
  let(:cyberpunk) { Client.new(ENV['TOKEN']) }

  describe '#initialize' do
    it 'to create an valid instance' do
      expect(cyberpunk).to be_a(Client)
    end
  end
end
