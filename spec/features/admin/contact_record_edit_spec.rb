require 'spec_helper'

describe 'Contact Record editing', auth: :user do
  include Admin::ContactRecordSteps

  let!(:contact_type)  { ContactType.create(title: 'new contact type') }
  let!(:office1)       { create :office  }
  let!(:office2)       { create :office  }
  let(:contact_record) { create :contact_record  }

  before { verify contact_record_exists(contact_record) }

  specify 'it can be updated' do
    update_contact_record(
      contact_record,
      description: 'new description',
      more_info_website: 'more info website entry',
      more_info_phone_number: 'more info phone number entry'
    ) do
      select contact_type, from: 'contact_record_contact_type_id'
      select office1.title, from: 'contact_record_office_ids'
      select office2.title, from: 'contact_record_office_ids'
    end

    verify contact_record_updated(
      contact_record,
      description: 'new description',
      more_info_website: 'more info website entry',
      more_info_phone_number: 'more info phone number entry'
    )
    verify associated_to_contact_type(contact_record, contact_type)
    verify associated_to_offices(contact_record, office1, office2)
  end
end
