require 'spec_helper'

describe ContactRecord do
  describe '#keywords' do
    let(:contact)  { create :contact_record }

    it 'is a serialized Array' do
      contact.keywords << 'kw1'
      contact.keywords << 'kw2'
      contact.save

      expect(contact.reload.keywords).to eq ['kw1', 'kw2']
    end
  end
end
