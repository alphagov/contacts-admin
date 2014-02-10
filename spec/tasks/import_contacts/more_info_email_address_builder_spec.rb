require "spec_helper"

describe ImportContacts::MoreInfoEmailAddressBuilder do
  describe ".build" do
    let(:content)             { "description paragraph" }
    let(:email_address_title) { "email_address title" }
    let(:email_address_desc)  { "email_address description" }
    let(:email_address_link)  { "http://www.example.com" }

    let(:input_attributes) {
      {
        "emailmoreinfo" => content,
        "emailmoreinfourltitle" => email_address_title,
        "emailmoreinfourltag" => email_address_desc,
        "emailmoreinfourl" => email_address_link
      }
    }

    it "builds more info record" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record).to be_kind_of ImportContacts::MoreInfoRecord
    end

    it "assigns url" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.url).to eq email_address_link
    end

    it "assigns url title" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.title).to eq email_address_title
    end

    it "assigns url description" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.description).to eq email_address_desc
    end

    it "assigns additional content" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.content).to eq content
    end
  end
end
