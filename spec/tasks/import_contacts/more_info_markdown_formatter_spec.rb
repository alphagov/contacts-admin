require 'spec_helper'

describe ImportContacts::MoreInfoMarkdownFormatter do
  describe '#format' do
    let(:url)         { 'http://www.example.com' }
    let(:title)       { 'title' }
    let(:description) { 'description' }
    let(:content)     { 'content' }

    let(:more_info_record) {
      ImportContacts::MoreInfoRecord.new(
        more_info_url: ImportContacts::MoreInfoUrl.new(
          url: url,
          title: title,
          description: description
        ),
        content: content
      )
    }

    it 'includes MoreInfoUrl formatted as Markdown link' do
      expect(described_class.new(more_info_record).format).to match /\[http:\/\/www\.example\.com\]\(title\)/
    end

    it 'includes MoreInfoUrl description' do
      expect(described_class.new(more_info_record).format).to include description
    end

    it 'includes content' do
      expect(described_class.new(more_info_record).format).to include content
    end
  end
end
