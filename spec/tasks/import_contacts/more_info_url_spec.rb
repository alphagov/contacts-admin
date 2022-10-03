require "rails_helper"

describe ImportContacts::MoreInfoUrl do
  let(:url)         { "http://www.example.com" }
  let(:title)       { "title" }
  let(:description) { "description" }

  describe "#to_markdown" do
    context "url present, url title missing" do
      context "url description present" do
        let(:more_info_url) do
          described_class.new(
            url:,
            title: nil,
            description:,
          )
        end

        it "renders url description" do
          expect(more_info_url.to_markdown).to include description
        end

        it "does not render title" do
          expect(more_info_url.to_markdown).not_to include title
        end

        it "does not render url" do
          expect(more_info_url.to_markdown).not_to include url
        end
      end

      context "url description missing" do
        let(:more_info_url) do
          described_class.new(
            url:,
            title: nil,
            description: nil,
          )
        end

        it "does not render description" do
          expect(more_info_url.to_markdown).not_to include description
        end

        it "does not render title" do
          expect(more_info_url.to_markdown).not_to include title
        end

        it "does not render url" do
          expect(more_info_url.to_markdown).not_to include url
        end
      end
    end

    context "url missing, url title present" do
      context "url description present" do
        let(:more_info_url) do
          described_class.new(
            url: nil,
            title:,
            description:,
          )
        end

        it "renders just url description" do
          expect(more_info_url.to_markdown).to include description
        end

        it "does not render title" do
          expect(more_info_url.to_markdown).not_to include title
        end

        it "does not render url" do
          expect(more_info_url.to_markdown).not_to include url
        end
      end

      context "url description missing" do
        let(:more_info_url) do
          described_class.new(
            url: nil,
            title:,
            description: nil,
          )
        end

        it "does not render description" do
          expect(more_info_url.to_markdown).not_to include description
        end

        it "does not render title" do
          expect(more_info_url.to_markdown).not_to include title
        end

        it "does not render url" do
          expect(more_info_url.to_markdown).not_to include url
        end
      end
    end

    context "url present, url title present" do
      context "url description present" do
        let(:more_info_url) do
          described_class.new(
            url:,
            title:,
            description:,
          )
        end

        it "renders description" do
          expect(more_info_url.to_markdown).to include description
        end

        it "renders title" do
          expect(more_info_url.to_markdown).to include title
        end

        it "renders url" do
          expect(more_info_url.to_markdown).to include url
        end
      end

      context "url description missing" do
        let(:more_info_url) do
          described_class.new(
            url:,
            title:,
            description: nil,
          )
        end

        it "does not render description" do
          expect(more_info_url.to_markdown).not_to include description
        end

        it "renders title" do
          expect(more_info_url.to_markdown).to include title
        end

        it "renders url" do
          expect(more_info_url.to_markdown).to include url
        end
      end
    end
  end
end
