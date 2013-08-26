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

    it 'assigns contact_form_url' do
      contact_form_url = 'http://www.example.com'
      attributes = {'overrideurl' => contact_form_url}

      expect(described_class.build(attributes).contact_form_url).to eq contact_form_url
    end

    it 'assigns email text head' do
      email_text_head = 'email text head'
      attributes = {'emailtexthead' => email_text_head}

      expect(described_class.build(attributes).email_text_head).to eq email_text_head
    end

    it 'assigns post text head' do
      post_text_head = 'post text head'
      attributes = {'posttexthead' => post_text_head}

      expect(described_class.build(attributes).post_text_head).to eq post_text_head
    end

    it 'assigns post name' do
      post_name = 'post name'
      attributes = {'post_name' => post_name}

      expect(described_class.build(attributes).post_name).to eq post_name
    end
  end
end
