require 'spec_helper'

describe ImportContacts::NumberBuilder do
  describe '.build' do
    let(:contact_record) { build :contact_record }
    let(:number_title)      { 'webnumber title' }
    let(:number_head)       { 'phone number head' }
    let(:number_hours)      { 'phone hours' }
    let(:number_telephone)  { '555-111-55551' }

    context 'with primary phone number record' do
      let(:input_attributes) {
        {
          'telephonename' => number_title,
          'phonetexthead' => number_head,
          'phoneopenhours' => number_hours,
          'telephone' => number_telephone
        }
      }

      it 'builds number record' do
        numbers = described_class.build(contact_record, input_attributes)

        expect(
          numbers.detect { |number|
            number.title == number_title &&
            number.number == number_telephone &&
            number.open_hours == number_hours &&
            number.description == number_head
          }
        ).to be_present
      end
    end

    context 'with secondary phone number record' do
      let(:input_attributes) {
        {
          'telephonename2' => number_title,
          'phonetexthead2' => number_head,
          'phoneopenhours2' => number_hours,
          'telephone2' => number_telephone
        }
      }

      it 'builds number record' do
        numbers = described_class.build(contact_record, input_attributes)

        expect(
          numbers.detect { |number|
            number.title == number_title &&
            number.number == number_telephone &&
            number.open_hours == number_hours &&
            number.description == number_head
          }
        ).to be_present
      end
    end
  end
end
