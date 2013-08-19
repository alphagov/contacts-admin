require 'spec_helper'

describe ImportContacts::MoreInfoNumberBuilder do
  describe '.build' do
    let(:contact_record)   { build :contact_record }
    let(:description)      { 'description paragraph' }
    let(:number_title)    { 'number title' }
    let(:number_desc)     { 'number description' }
    let(:number_link)     { 'http://www.example.com' }

    let(:input_attributes) {
      {
        'phonemoreinfo' => description,
        'phonemoreinfourltitle' => number_title,
        'phonemoreinfourltag' => number_desc,
        'phonemoreinfourl' => number_link
      }
    }

    it 'builds more info number record' do
      more_info_number_record = described_class.build(contact_record, input_attributes)

      expect(contact_record.more_info_number).to be_present
      expect(contact_record.more_info_number.description).to eq description
      expect(contact_record.more_info_number.url_title).to eq number_title
      expect(contact_record.more_info_number.url).to eq number_link
      expect(contact_record.more_info_number.url_description).to eq number_desc
    end
  end
end
