require 'spec_helper'

describe ImportContacts::MoreInfoEmailAddressBuilder do
  describe '.build' do
    let(:contact_record)   { build :contact_record }
    let(:description)      { 'description paragraph' }
    let(:email_address_title)    { 'email_address title' }
    let(:email_address_desc)     { 'email_address description' }
    let(:email_address_link)     { 'http://www.example.com' }

    let(:input_attributes) {
      {
        'emailmoreinfo' => description,
        'emailmoreinfourltitle' => email_address_title,
        'emailmoreinfourltag' => email_address_desc,
        'emailmoreinfourl' => email_address_link
      }
    }

    it 'builds more info email_address record' do
      more_info_email_address_record = described_class.build(contact_record, input_attributes)

      expect(contact_record.more_info_email_address).to be_present
      expect(contact_record.more_info_email_address.description).to eq description
      expect(contact_record.more_info_email_address.url_title).to eq email_address_title
      expect(contact_record.more_info_email_address.url).to eq email_address_link
      expect(contact_record.more_info_email_address.url_description).to eq email_address_desc
    end
  end
end
