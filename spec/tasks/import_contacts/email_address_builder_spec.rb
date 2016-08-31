require "rails_helper"

describe ImportContacts::EmailAddressBuilder do
  describe ".build" do
    let(:contact) { build :contact }
    let(:email_title)    { "email title" }
    let(:email_desc)     { "email description" }
    let(:email_address)  { "email@example.com" }
    let(:email_link)     { "http://www.example.com" }

    context "with primary email record" do
      let(:input_attributes) {
        {
          "emailtitle1" => email_title,
          "emailtag1" => email_desc,
          "emailurl1" => email_link,
          "emailaddress1" => email_address
        }
      }

      it "builds email record" do
        email_addresses = described_class.build(contact, input_attributes)

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

    context "with secondary email record" do
      let(:input_attributes) {
        {
          "emailtitle2" => email_title,
          "emailtag2" => email_desc,
          "emailurl2" => email_link,
          "emailaddress2" => email_address
        }
      }

      it "builds secondary email record" do
        email_addresses = described_class.build(contact, input_attributes)

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
  end
end
