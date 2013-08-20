require 'spec_helper'

describe 'Contact Record editing', auth: :user do
  include Admin::ContactRecordSteps

  let!(:contact_type)   { ContactType.create(title: 'new contact type') }
  let!(:contact1)       { create :contact  }
  let!(:contact2)       { create :contact  }
  let(:contact_record)  { create :contact_record  }

  before { verify contact_record_exists(contact_record) }

  specify 'it can be updated' do
    update_contact_record(contact_record, description: 'new description') do
      select contact_type, from: 'contact_record_contact_type_id'
      select contact1.title, from: 'contact_record_contact_ids'
      select contact2.title, from: 'contact_record_contact_ids'
    end

    verify contact_record_updated(contact_record, description: 'new description')
    verify associated_to_contact_type(contact_record, contact_type)
    verify associated_to_contacts(contact_record, contact1, contact2)
  end

  private

  def associated_to_contact_type(contact_record, contact_type)
    contact_record.reload.contact_type == contact_type
  end

  def associated_to_contacts(contact_record, *contacts)
    contacts.all? { |contact|
      contact_record.reload.contacts.include?(contact)
    }
  end
end
