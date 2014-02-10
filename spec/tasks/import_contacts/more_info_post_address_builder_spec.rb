require "spec_helper"

describe ImportContacts::MoreInfoPostAddressBuilder do
  describe ".build" do
    let(:content)             { "description paragraph" }
    let(:post_address_title)  { "post_address title" }
    let(:post_address_desc)   { "post_address description" }
    let(:post_address_link)   { "http://www.example.com" }

    let(:input_attributes) {
      {
        "postmoreinfo" => content,
        "postmoreinfourltitle" => post_address_title,
        "postmoreinfourltag" => post_address_desc,
        "postmoreinfourl" => post_address_link
      }
    }

    it "builds more info post_address record" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record).to be_kind_of ImportContacts::MoreInfoRecord
    end

    it "assigns url" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.url).to eq post_address_link
    end

    it "assigns url title" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.title).to eq post_address_title
    end

    it "assigns url description" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.description).to eq post_address_desc
    end

    it "assigns additional content" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.content).to eq content
    end
  end
end
