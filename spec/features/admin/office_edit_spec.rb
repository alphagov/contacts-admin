require 'spec_helper'

describe 'Office editing', auth: :user do
  include Admin::OfficeSteps

  let!(:department)     { Department.create(title: 'example department') }
  let!(:contact) { create :contact }
  let(:office)          { create :office  }

  before { verify office_exists(office) }

  specify 'it can be updated' do
    update_office(office, title: 'new title') do
      select department, from: 'office_department_id'
      select contact, from: 'office_contact_id'
    end

    verify office_updated(office, title: 'new title')
    verify associated_to_department(office, department)
    verify associated_to_contact(office, contact)
  end
end
