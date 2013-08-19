require 'spec_helper'

describe ImportContacts::ContactBuilder do
  describe '.build' do
    let(:contact_record) { build :contact_record }
    let(:titles)    { "title1\ntitle2" }

    let(:input_attributes) {
      {
        'title' => titles
      }
    }

    it 'builds contact record: title1' do
      contacts = described_class.build(contact_record, input_attributes)

      expect(
        contacts.detect { |contact|
          contact.title == 'title1'
        }
      ).to be_present
    end

    it 'builds contact record: title2' do
      contacts = described_class.build(contact_record, input_attributes)

      expect(
        contacts.detect { |contact|
          contact.title == 'title2'
        }
      ).to be_present
    end

    it 'assigns contact to HMRC (by default)' do
      contacts = described_class.build(contact_record, input_attributes)

      expect(
        contacts.all? { |contact|
          contact.department == Department.hmrc
        }
      ).to be_true
    end
  end
end
