require 'spec_helper'

describe 'Contact editing', auth: :user do
  include Admin::ContactSteps

  let!(:contact_type)  { ContactType.create(title: 'new contact type') }
  let!(:office1)       { create :office  }
  let!(:office2)       { create :office  }
  let(:contact) { create :contact  }

  before { verify contact_exists(contact) }

  specify 'it can be updated' do
    update_contact(
      contact,
      description: 'new description',
      more_info_website: 'more info website entry',
      more_info_phone_number: 'more info phone number entry'
    ) do
      select contact_type, from: 'contact_contact_type_id'
      select office1.title, from: 'contact_office_ids'
      select office2.title, from: 'contact_office_ids'
    end

    verify contact_updated(
      contact,
      description: 'new description',
      more_info_website: 'more info website entry',
      more_info_phone_number: 'more info phone number entry'
    )
    verify associated_to_contact_type(contact, contact_type)
    verify associated_to_offices(contact, office1, office2)
  end
end
