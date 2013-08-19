require 'spec_helper'

describe ImportContacts::MoreInfoWebsiteBuilder do
  describe '.build' do
    let(:contact_record)   { build :contact_record }
    let(:description)      { 'description paragraph' }
    let(:website_title)    { 'website title' }
    let(:website_desc)     { 'website description' }
    let(:website_link)     { 'http://www.example.com' }

    let(:input_attributes) {
      {
        'ogmoreinfo' => description,
        'ogmoreinfourltitle' => website_title,
        'ogmoreinfourltag' => website_desc,
        'ogmoreinfourl' => website_link
      }
    }

    it 'builds more info website record' do
      more_info_website_record = described_class.build(contact_record, input_attributes)

      expect(contact_record.more_info_website).to be_present
      expect(contact_record.more_info_website.description).to eq description
      expect(contact_record.more_info_website.url_title).to eq website_title
      expect(contact_record.more_info_website.url).to eq website_link
      expect(contact_record.more_info_website.url_description).to eq website_desc
    end
  end
end
