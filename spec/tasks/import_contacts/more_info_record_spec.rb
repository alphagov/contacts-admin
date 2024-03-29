require "rails_helper"

describe ImportContacts::MoreInfoRecord do
  let(:url_content)   { "http://www.example.com" }
  let(:content)       { "content" }
  let(:more_info_url) do
    ImportContacts::MoreInfoUrl.new(
      title: "url title",
      url: url_content,
    )
  end

  describe "#to_markdown" do
    context "url content present, content present" do
      let(:more_info_record) do
        described_class.new(
          content:,
          more_info_url:,
        )
      end

      it "includes url content" do
        expect(more_info_record.to_markdown).to include content
      end

      it "includes content" do
        expect(more_info_record.to_markdown).to include url_content
      end
    end

    context "url content missing, content present" do
      let(:more_info_record) do
        described_class.new(
          content:,
          more_info_url: nil,
        )
      end

      it "does not include url content" do
        expect(more_info_record.to_markdown).to include content
      end

      it "includes content" do
        expect(more_info_record.to_markdown).not_to include url_content
      end
    end

    context "url content present, content missing" do
      let(:more_info_record) do
        described_class.new(
          content: nil,
          more_info_url:,
        )
      end

      it "includes url content" do
        expect(more_info_record.to_markdown).not_to include content
      end

      it "does not include content" do
        expect(more_info_record.to_markdown).to include url_content
      end
    end

    context "url content missing, content missing" do
      let(:more_info_record) do
        described_class.new(
          content: nil,
          more_info_url: nil,
        )
      end

      it "does not include url content" do
        expect(more_info_record.to_markdown).not_to include url_content
      end

      it "does not include content" do
        expect(more_info_record.to_markdown).not_to include content
      end
    end
  end
end
