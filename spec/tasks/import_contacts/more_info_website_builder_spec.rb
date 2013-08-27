require 'spec_helper'

describe ImportContacts::MoreInfoWebsiteBuilder do
  describe '.build' do
    let(:content)          { 'description paragraph' }
    let(:website_title)    { 'website title' }
    let(:website_desc)     { 'website description' }
    let(:website_link)     { 'http://www.example.com' }

    let(:input_attributes) {
      {
        'ogmoreinfo' => content,
        'ogmoreinfourltitle' => website_title,
        'ogmoreinfourltag' => website_desc,
        'ogmoreinfourl' => website_link
      }
    }

    it 'builds more info record' do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record).to be_kind_of ImportContacts::MoreInfoRecord
    end

    it 'assigns url' do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.url).to eq website_link
    end

    it 'assigns url title' do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.title).to eq website_title
    end

    it 'assigns url description' do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.more_info_url.description).to eq website_desc
    end

    it 'assigns additional content' do
      more_info_record = described_class.build(input_attributes)

      expect(more_info_record.content).to eq content
    end
  end
end
