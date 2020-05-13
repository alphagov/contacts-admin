require "rails_helper"

describe ImportContacts::PostAddressBuilder do
  describe ".build" do
    let(:contact) { build :contact }
    let(:posttitle)         { "post title" }
    let(:postaddress_desc)  { "post description" }
    let(:postaddress)       { "some address" }
    let(:postlink)          { "http://www.example.com" }

    context "with primary post address record" do
      let(:input_attributes) do
        {
          "postaddresstag1" => postaddress_desc,
          "postaddress1" => postaddress,
        }
      end

      it "builds post address record" do
        post_addresses = described_class.build(contact, input_attributes)

        expect(
          post_addresses.detect do |pa|
            pa.description == postaddress_desc &&
            pa.address == postaddress
          end,
        ).to be_present
      end
    end

    context "with secondary postaddress record" do
      let(:input_attributes) do
        {
          "postaddresstag2" => postaddress_desc,
          "postaddress2" => postaddress,
        }
      end

      it "builds secondary post address record" do
        post_addresses = described_class.build(contact, input_attributes)

        expect(
          post_addresses.detect do |pa|
            pa.description == postaddress_desc &&
            pa.address == postaddress
          end,
        ).to be_present
      end
    end

    context "with third post address record" do
      let(:input_attributes) do
        {
          "postaddresstag3" => postaddress_desc,
          "postaddress3" => postaddress,
        }
      end

      it "builds third post address record" do
        post_addresses = described_class.build(contact, input_attributes)

        expect(
          post_addresses.detect do |pa|
            pa.description == postaddress_desc &&
            pa.address == postaddress
          end,
        ).to be_present
      end
    end
  end
end
