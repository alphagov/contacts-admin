require 'spec_helper'

describe ImportContacts::OfficeBuilder do
  describe '.build' do
    let(:contact_record) { build :contact_record }
    let(:titles)         { "title1\ntitle2" }
    let!(:department)    { create :department, title: 'HMRC', id: 1 }

    let(:input_attributes) {
      {
        'title' => titles
      }
    }

    it 'builds contact record: title1' do
      offices = described_class.build(contact_record, input_attributes)

      expect(
        offices.detect { |office|
          office.title == 'title1'
        }
      ).to be_present
    end

    it 'builds contact record: title2' do
      offices = described_class.build(contact_record, input_attributes)

      expect(
        offices.detect { |office|
          office.title == 'title2'
        }
      ).to be_present
    end

    it 'assigns contact to HMRC (by default)' do
      offices = described_class.build(contact_record, input_attributes)

      expect(
        offices.all? { |office|
          office.department == Department.hmrc
        }
      ).to be_true
    end

    specify 'assigned contacts are valid' do
      offices = described_class.build(contact_record, input_attributes)

      expect(offices.all?(&:valid?)).to be_true
    end
  end
end
