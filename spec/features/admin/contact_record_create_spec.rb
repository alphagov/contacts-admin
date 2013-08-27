require 'spec_helper'

describe 'Contact Record creation', auth: :user do
  include Admin::ContactRecordSteps

  let!(:contact_type)  { ContactType.create(title: 'new contact type') }
  let!(:office1)       { create :office  }
  let!(:office2)       { create :office  }
  let(:contact_record) { build :contact_record  }

  before {
    verify !contact_record_exists(contact_record)
  }

  specify 'it can be created' do
    create_contact_record({
      description: contact_record.description,
      contact_information: contact_record.contact_information
    }) do
      select contact_type, from: 'contact_record_contact_type_id'
      select office1.title, from: 'contact_record_office_ids'
      select office2.title, from: 'contact_record_office_ids'
    end

    verify contact_record_exists(contact_record)
  end
end
