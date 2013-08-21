require 'spec_helper'

describe 'Contact creation', auth: :user do
  include Admin::ContactSteps

  let!(:department)     { Department.create(title: 'example department') }
  let!(:contact_record) { create :contact_record }
  let(:contact)         { build :contact  }

  before {
    verify !contact_exists(contact)
  }

  specify 'it can be created' do
    create_contact({
      title: contact.title
    }) do
      select department, from: 'contact_department_id'
      select contact_record, from: 'contact_contact_record_id'
    end

    verify contact_exists(contact)
  end
end
