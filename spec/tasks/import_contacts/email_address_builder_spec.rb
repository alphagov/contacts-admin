require 'spec_helper'

describe ImportContacts::EmailAddressBuilder do
  describe '.build' do
    let(:contact_record) { build :contact_record }
    let(:email_title)    { 'email title' }
    let(:email_desc)     { 'email description' }
    let(:email_address)  { 'email@example.com' }
    let(:email_link)     { 'http://www.example.com' }

    context 'with primary email record' do
      let(:input_attributes) {
        {
          'emailtitle1' => email_title,
          'emailtag1' => email_desc,
          'emailurl1' => email_link,
          'emailaddress1' => email_address
        }
      }

      it 'builds email record' do
        email_addresses = described_class.build(contact_record, input_attributes)

        expect(
          email_addresses.detect { |email|
            email.title == email_title &&
            email.description == email_desc &&
            email.email == email_address &&
            email.link == email_link
          }
        ).to be_present
      end
    end

    context 'with secondary email record' do
      let(:input_attributes) {
        {
          'emailtitle2' => email_title,
          'emailtag2' => email_desc,
          'emailurl2' => email_link,
          'emailaddress2' => email_address
        }
      }

      it 'builds secondary email record' do
        email_addresses = described_class.build(contact_record, input_attributes)

        expect(
          email_addresses.detect { |email|
            email.title == email_title &&
            email.description == email_desc &&
            email.email == email_address &&
            email.link == email_link
          }
        ).to be_present
      end
    end

    context 'with third email record' do
      let(:email_more_info) { 'more info' }
      let(:input_attributes) {
        {
          'emailmoreinfo' => email_more_info,
          'emailmoreinfourl' => email_link,
          'emailmoreinfourltitle' => email_title,
          'emailmoreinfourltag' => email_desc,
          'emailaddress2' => email_address
        }
      }

      it 'builds third email record' do
        pending
      end
    end

    context 'with invalid email address records' do
      let(:input_attributes) {
        {
          'emailtitle2' => email_title,
          'emailtag2' => email_desc,
          'emailurl2' => email_link,
          'emailaddress2' => nil
        }
      }
    end
  end
end
