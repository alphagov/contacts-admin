require 'spec_helper'

describe ImportContacts::PhoneNumberBuilder do
  describe '.build' do
    let(:contact) { build :contact }
    let(:number_title)      { 'webnumber title' }
    let(:number_head)       { 'phone number head' }
    let(:number_hours)      { 'phone hours' }
    let(:number_telephone)  { '555-111-55551' }
    let(:number_textphone)  { '0845 302 1408' }
    let(:number_international) { '+44 135 535 9022' }
    let(:number_fax)        { '+44 1274 204198' }

    context 'with primary phone number record' do
      let(:input_attributes) {
        {
          'telephonename' => number_title,
          'phonetexthead' => number_head,
          'phoneopenhours' => number_hours,
          'telephone' => number_telephone,
          'textphone' => number_textphone,
          'international' => number_international,
          'fax' => number_fax
        }
      }

      it 'builds number record' do
        numbers = described_class.build(contact, input_attributes)

        expect(
          numbers.detect { |number|
            number.title == number_title &&
            number.number == number_telephone &&
            number.open_hours == number_hours &&
            number.description == number_head
          }
        ).to be_present
      end

      it 'assigns fax, international and textphone numbers to first PhoneNumber record' do
        numbers = described_class.build(contact, input_attributes)

        expect(
          numbers.detect { |number|
            number.fax == number_fax &&
            number.international_phone == number_international &&
            number.textphone == number_textphone
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
        numbers = described_class.build(contact, input_attributes)

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
