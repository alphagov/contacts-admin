require "rails_helper"

describe ImportContacts::MoreInfoRecord do
  let(:url_content)   { "http://www.example.com" }
  let(:content)       { "content" }
  let(:more_info_url) {
    ImportContacts::MoreInfoUrl.new(
      title: "url title",
      url: url_content
    )
  }

  describe "#to_markdown" do
    context "url content present, content present" do
      let(:more_info_record) {
        described_class.new(
          content: content,
          more_info_url: more_info_url
        )
      }

      it "includes url content" do
        expect(more_info_record.to_markdown).to include content
      end

      it "includes content" do
        expect(more_info_record.to_markdown).to include url_content
      end
    end

    context "url content missing, content present" do
      let(:more_info_record) {
        described_class.new(
          content: content,
          more_info_url: nil
        )
      }

      it "does not include url content" do
        expect(more_info_record.to_markdown).to include content
      end

      it "includes content" do
        expect(more_info_record.to_markdown).not_to include url_content
      end
    end

    context "url content present, content missing" do
      let(:more_info_record) {
        described_class.new(
          content: nil,
          more_info_url: more_info_url
        )
      }

      it "includes url content" do
        expect(more_info_record.to_markdown).not_to include content
      end

      it "does not include content" do
        expect(more_info_record.to_markdown).to include url_content
      end
    end

    context "url content missing, content missing" do
      let(:more_info_record) {
        described_class.new(
          content: nil,
          more_info_url: nil
        )
      }

      it "does not include url content" do
        expect(more_info_record.to_markdown).not_to include url_content
      end

      it "does not include content" do
        expect(more_info_record.to_markdown).not_to include content
      end
    end
  end
end
