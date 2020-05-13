require "rails_helper"

describe ImportContacts::ContactFormLinkBuilder do
  describe ".build" do
    let(:contact)    { build :contact }
    let(:site_title) { "website title" }
    let(:site_desc)  { "website description" }
    let(:site_link)  { "http://www.url.com" }

    context "with primary website record" do
      let(:input_attributes) do
        {
          "ogtitle1" => site_title,
          "ogtag1" => site_desc,
          "ogurl1" => site_link,
        }
      end

      it "builds website record" do
        websites = described_class.build(contact, input_attributes)

        expect(
          websites.detect do |website|
            website.title == site_title &&
            website.description == site_desc &&
            website.link == site_link
          end,
        ).to be_present
      end
    end

    context "with secondary website record" do
      let(:input_attributes) do
        {
          "ogtitle2" => site_title,
          "ogtag2" => site_desc,
          "ogurl2" => site_link,
        }
      end

      it "builds secondary website record" do
        websites = described_class.build(contact, input_attributes)

        expect(
          websites.detect do |website|
            website.title == site_title &&
            website.description == site_desc &&
            website.link == site_link
          end,
        ).to be_present
      end
    end
  end
end
