require 'spec_helper'

describe ImportContacts::PostAddressBuilder do
  describe '.build' do
    let(:contact_record)    { build :contact_record }
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
        post_addresses = described_class.build(contact_record, input_attributes)

        expect(
          post_addresses.detect { |pa|
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
        post_addresses = described_class.build(contact_record, input_attributes)

        expect(
          post_addresses.detect { |pa|
            pa.description == postaddress_desc &&
            pa.address == postaddress
          }
        ).to be_present
      end
    end

    context 'with third post address record' do
      let(:input_attributes) {
        {
          'postaddresstag3' => postaddress_desc,
          'postaddress3' => postaddress
        }
      }

      it 'builds third post address record' do
        post_addresses = described_class.build(contact_record, input_attributes)

        expect(
          post_addresses.detect { |pa|
            pa.description == postaddress_desc &&
            pa.address == postaddress
          }
        ).to be_present
      end
    end
  end
end
