require 'spec_helper'

describe ImportContacts::WebsiteBuilder do
  describe '.build' do
    let(:contact_record)    { build :contact_record }
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
        websites = described_class.build(contact_record, input_attributes)

        expect(
          websites.detect { |website|
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
        websites = described_class.build(contact_record, input_attributes)

        expect(
          websites.detect { |website|
            website.title == site_title &&
            website.description == site_desc &&
            website.link == site_link
          }
        ).to be_present
      end
    end
  end
end
