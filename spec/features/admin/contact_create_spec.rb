require 'spec_helper'

describe 'Contact creation', auth: :user do
  include Admin::ContactSteps

  let!(:contact_group)  { ContactGroup.create(title: 'new contact type') }
  let!(:office1)       { create :office  }
  let!(:office2)       { create :office  }
  let(:contact)        { build :contact  }

  before {
    verify !contact_exists(contact)
  }

  specify 'it can be created' do
    create_contact({
      description: contact.description,
      contact_information: contact.contact_information
    }) do
      select contact_group, from: 'contact_contact_group_id'
      select office1.title, from: 'contact_office_ids'
      select office2.title, from: 'contact_office_ids'
    end

    verify contact_exists(contact)
  end
end
