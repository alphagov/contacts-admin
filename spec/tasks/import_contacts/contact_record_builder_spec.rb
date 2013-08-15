require 'spec_helper'

describe ImportContacts::ContactRecordBuilder do
  describe 'build' do
    it 'returns instance of ContactRecord' do
      expect(described_class.build({})).to be_kind_of ContactRecord
    end

    it 'assigns description to contact record' do
      description = 'some description'
      attributes = {'description' => description}

      expect(described_class.build(attributes).description).to eq description
    end

    it 'assigns keywords to contact record' do
      keywords = 'kw1,kw2'
      attributes = {'keywords' => keywords}

      expect(described_class.build(attributes).keywords).to eq ['kw1', 'kw2']
    end

    it 'assigns contact type' do
      contact_type = 'See also'
      attributes = {'clustergroup' => contact_type}

      expect(described_class.build(attributes).contact_type).to eq ContactType.find_by_title(contact_type)
    end
  end
end
