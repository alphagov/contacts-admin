require 'spec_helper'

describe Contact do
  describe '#keywords' do
    let(:contact)  { create :contact }

    it 'is a serialized Array' do
      contact.keywords << 'kw1'
      contact.keywords << 'kw2'
      contact.save

      expect(contact.reload.keywords).to eq ['kw1', 'kw2']
    end
  end
end
