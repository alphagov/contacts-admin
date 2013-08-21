require 'spec_helper'

describe 'Contact editing', auth: :user do
  include Admin::ContactSteps

  let!(:department)     { Department.create(title: 'example department') }
  let!(:contact_record) { create :contact_record }
  let(:contact)         { create :contact  }

  before { verify contact_exists(contact) }

  specify 'it can be updated' do
    update_contact(contact, title: 'new title') do
      select department, from: 'contact_department_id'
      select contact_record, from: 'contact_contact_record_id'
    end

    verify contact_updated(contact, title: 'new title')
    verify associated_to_department(contact, department)
    verify associated_to_contact_record(contact, contact_record)
  end
end
