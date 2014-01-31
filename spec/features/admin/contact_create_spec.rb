require 'spec_helper'

describe 'Contact creation', auth: :user do
  include Admin::ContactSteps

  let!(:contact_group) { create(:contact_group, title: 'new contact type') }
  let(:contact)        { build :contact }

  before {
    verify !contact_exists(contact)
  }

  specify 'it can be created' do
    create_contact({
      title: contact.title,
      description: contact.description,
      contact_information: contact.contact_information
    }) do
      select contact.department, from: "contact_department_id"
      select contact_group, from: 'contact_contact_group_ids'
    end

    verify contact_exists(contact)
  end
end
