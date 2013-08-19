require 'spec_helper'

describe ImportContacts::MoreInfoPostAddressBuilder do
  describe '.build' do
    let(:contact_record)   { build :contact_record }
    let(:description)      { 'description paragraph' }
    let(:post_address_title)    { 'post_address title' }
    let(:post_address_desc)     { 'post_address description' }
    let(:post_address_link)     { 'http://www.example.com' }

    let(:input_attributes) {
      {
        'postmoreinfo' => description,
        'postmoreinfourltitle' => post_address_title,
        'postmoreinfourltag' => post_address_desc,
        'postmoreinfourl' => post_address_link
      }
    }

    it 'builds more info post_address record' do
      more_info_post_address_record = described_class.build(contact_record, input_attributes)

      expect(contact_record.more_info_post_address).to be_present
      expect(contact_record.more_info_post_address.description).to eq description
      expect(contact_record.more_info_post_address.url_title).to eq post_address_title
      expect(contact_record.more_info_post_address.url).to eq post_address_link
      expect(contact_record.more_info_post_address.url_description).to eq post_address_desc
    end
  end
end
