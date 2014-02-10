require "spec_helper"

describe ImportContacts::MoreInfoUrl do
  let(:url)         { "http://www.example.com" }
  let(:title)       { "title" }
  let(:description) { "description" }

  describe "#to_markdown" do
    context "url present, url title missing" do
      context "url description present" do
        let(:more_info_url) {
          described_class.new(
            url: url,
            title: nil,
            description: description
          )
        }

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
        let(:more_info_url) {
          described_class.new(
            url: url,
            title: nil,
            description: nil
          )
        }

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
        let(:more_info_url) {
          described_class.new(
            url: nil,
            title: title,
            description: description
          )
        }

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
        let(:more_info_url) {
          described_class.new(
            url: nil,
            title: title,
            description: nil
          )
        }

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
        let(:more_info_url) {
          described_class.new(
            url: url,
            title: title,
            description: description
          )
        }

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
        let(:more_info_url) {
          described_class.new(
            url: url,
            title: title,
            description: nil
          )
        }

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
