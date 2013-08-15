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
      pending
    end

    context 'with website association' do
      pending
    end

    context 'with phone number association' do
      pending
    end
  end
end
