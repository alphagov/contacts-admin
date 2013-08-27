require 'spec_helper'

describe 'Contact Record creation', auth: :user do
  include Admin::ContactRecordSteps

  let!(:contact_type)   { ContactType.create(title: 'new contact type') }
  let!(:contact1)       { create :contact  }
  let!(:contact2)       { create :contact  }
  let(:contact_record)  { build :contact_record  }

  before {
    verify !contact_record_exists(contact_record)
  }

  specify 'it can be created' do
    create_contact_record({
      description: contact_record.description,
      contact_information: contact_record.contact_information
    }) do
      select contact_type, from: 'contact_record_contact_type_id'
      select contact1.title, from: 'contact_record_contact_ids'
      select contact2.title, from: 'contact_record_contact_ids'
    end

    verify contact_record_exists(contact_record)
  end
end
