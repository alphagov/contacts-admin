require 'spec_helper'

describe ImportContacts::ContactRecordBuilder do
  describe 'build' do
    it 'returns instance of ContactRecord' do
      expect(described_class.build({})).to be_kind_of Contact
    end

    context 'with email association' do
      pending
    end

    context 'with post address association' do
      pending
    end

    context 'with website association' do
      pending
    end

    context 'with phone number association' do
      pending
    end
  end
end
