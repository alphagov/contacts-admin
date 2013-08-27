require 'spec_helper'

describe 'Office editing', auth: :user do
  include Admin::OfficeSteps

  let!(:department)     { Department.create(title: 'example department') }
  let!(:contact_record) { create :contact_record }
  let(:office)          { create :office  }

  before { verify office_exists(office) }

  specify 'it can be updated' do
    update_office(office, title: 'new title') do
      select department, from: 'office_department_id'
      select contact_record, from: 'office_contact_record_id'
    end

    verify office_updated(office, title: 'new title')
    verify associated_to_department(office, department)
    verify associated_to_contact_record(office, contact_record)
  end
end
