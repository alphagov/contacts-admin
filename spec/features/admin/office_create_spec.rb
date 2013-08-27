require 'spec_helper'

describe 'Office creation', auth: :user do
  include Admin::OfficeSteps

  let!(:department)     { Department.create(title: 'example department') }
  let!(:contact) { create :contact }
  let(:office)          { build :office  }

  before {
    verify !office_exists(office)
  }

  specify 'it can be created' do
    create_office({
      title: office.title
    }) do
      select department, from: 'office_department_id'
      select contact, from: 'office_contact_id'
    end

    verify office_exists(office)
  end
end
