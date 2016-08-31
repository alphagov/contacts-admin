require "rails_helper"

describe ImportContacts::MoreInfoPhoneNumberBuilder do
  describe ".build" do
    let(:content)        { "description paragraph" }
    let(:number_title)   { "number title" }
    let(:number_desc)    { "number description" }
    let(:number_link)    { "http://www.example.com" }

    let(:input_attributes) {
      {
        "phonemoreinfo" => content,
        "phonemoreinfourltitle" => number_title,
        "phonemoreinfourltag" => number_desc,
        "phonemoreinfourl" => number_link
      }
    }

    it "builds more info record" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record).to be_kind_of ImportContacts::MoreInfoRecord
    end

    it "assigns url" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.url).to eq number_link
    end

    it "assigns url title" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.title).to eq number_title
    end

    it "assigns url description" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.description).to eq number_desc
    end

    it "assigns additional content" do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.content).to eq content
    end
  end
end
