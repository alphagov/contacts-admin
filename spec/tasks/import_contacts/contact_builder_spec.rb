require 'spec_helper'

describe ImportContacts::ContactBuilder do
  describe 'build' do
    it 'returns instance of Contact' do
      expect(described_class.build({})).to be_kind_of Contact
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

    it 'assigns meta_title' do
      meta_title = 'meta title'
      attributes = {'alt_meta_title' => meta_title}

      expect(described_class.build(attributes).meta_title).to eq meta_title
    end

    it 'assigns meta_description' do
      meta_description = 'meta description'
      attributes = {'alt_meta_description' => meta_description}

      expect(described_class.build(attributes).meta_description).to eq meta_description
    end
  end
end
