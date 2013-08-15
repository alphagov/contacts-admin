require 'spec_helper'

describe ImportContacts::ContactRecordBuilder do
  describe 'build' do
    it 'returns instance of ContactRecord' do
      expect(described_class.build({})).to be_kind_of ContactRecord
    end

    context 'with website association' do
      let(:site_title) { 'website title' }
      let(:site_desc)  { 'website description' }
      let(:site_link)  { 'http://www.url.com' }

      context 'with primary website record' do
        let(:input_attributes) {
          {
            'ogtitle1' => site_title,
            'ogtag1' => site_desc,
            'ogurl1' => site_link
          }
        }

        it 'builds website record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.websites.detect { |website|
              website.title == site_title &&
              website.description == site_desc &&
              website.link == site_link
            }
          ).to be_present
        end
      end

      context 'with secondary website record' do
        let(:input_attributes) {
          {
            'ogtitle2' => site_title,
            'ogtag2' => site_desc,
            'ogurl2' => site_link
          }
        }

        it 'builds secondary website record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.websites.detect { |website|
              website.title == site_title &&
              website.description == site_desc &&
              website.link == site_link
            }
          ).to be_present
        end
      end

      context 'with third website record' do
        let(:site_more_info) { 'more info' }
        let(:input_attributes) {
          {
            'ogmoreinfo' => site_more_info,
            'ogmoreinfourltitle' => site_title,
            'ogmoreinfourltag' => site_desc,
            'ogmoreinfourl' => site_link
          }
        }

        it 'builds third website record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.websites.detect { |website|
              website.title == site_title &&
              website.description == site_desc &&
              website.link == site_link
              website.more_info == site_more_info
            }
          ).to be_present
        end
      end
    end

    context 'with post address association' do
      let(:posttitle)         { 'post title' }
      let(:postaddress_desc)  { 'post description' }
      let(:postaddress)       { 'some address' }
      let(:postlink)          { 'http://www.example.com' }

      context 'with primary post address record' do
        let(:input_attributes) {
          {
            'postaddresstag1' => postaddress_desc,
            'postaddress1' => postaddress
          }
        }

        it 'builds post address record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.post_addresses.detect { |pa|
              pa.description == postaddress_desc &&
              pa.address == postaddress
            }
          ).to be_present
        end
      end

      context 'with secondary postaddress record' do
        let(:input_attributes) {
          {
            'postaddresstag2' => postaddress_desc,
            'postaddress2' => postaddress
          }
        }

        it 'builds secondary post address record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.post_addresses.detect { |pa|
              pa.description == postaddress_desc &&
              pa.address == postaddress
            }
          ).to be_present
        end
      end

      context 'with third email record' do
        let(:input_attributes) {
          {
            'postaddresstag3' => postaddress_desc,
            'postaddress3' => postaddress
          }
        }

        it 'builds third email record' do
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.post_addresses.detect { |pa|
              pa.description == postaddress_desc &&
              pa.address == postaddress
            }
          ).to be_present
        end
      end

      context 'with more info post record' do
        let(:postaddress_more_info) { 'more info' }
        let(:postaddress_url) { 'http://www.example.com' }

        let(:input_attributes) {
          {
            'postmoreinfo' => postaddress_more_info,
            'postmoreinfourltitle' => postaddress_desc,
            'postmoreinfourltag' => postaddress,
            'postmoreinfourl' => postaddress_url
          }
        }

        it 'builds third email record' do
          pending
        end
      end
    end

    context 'with email association' do
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
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.email_addresses.detect { |email|
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
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.email_addresses.detect { |email|
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
          contact_record = described_class.build(input_attributes)

          expect(
            contact_record.email_addresses.detect { |email|
              email.title == email_title &&
              email.description == email_desc &&
              email.link == email_link &&
              email.more_info == email_more_info
            }
          ).to be_present
        end
      end
    end

    context 'with phone number association' do
      pending
    end
  end
end
