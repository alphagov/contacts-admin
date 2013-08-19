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

    it 'assigns alt_meta_title' do
      meta_title = 'meta title'
      attributes = {'alt_meta_title' => meta_title}

      expect(described_class.build(attributes).alt_meta_title).to eq meta_title
    end

    it 'assigns alt_meta_description' do
      meta_description = 'meta description'
      attributes = {'alt_meta_description' => meta_description}

      expect(described_class.build(attributes).alt_meta_description).to eq meta_description
    end

    it 'assigns alt_meta_keywords' do
      meta_keywords = 'meta keywords'
      attributes = {'alt_meta_keywords' => meta_keywords}

      expect(described_class.build(attributes).alt_meta_keywords).to eq meta_keywords
    end

    it 'assigns contact_form_url' do
      contact_form_url = 'http://www.example.com'
      attributes = {'overrideurl' => contact_form_url}

      expect(described_class.build(attributes).contact_form_url).to eq contact_form_url
    end
  end
end
