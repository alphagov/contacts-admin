require 'spec_helper'

describe 'Phone Number creation', auth: :user do
  include Admin::PhoneNumberSteps

  let(:contact_record) { create :contact_record }
  let(:number)         { build :phone_number, contact_record: contact_record }

  before {
    verify !phone_number_exists(contact_record, number)
  }

  specify 'it can be created' do
    create_phone_number(contact_record, {
      number: number.number,
      title: number.title
    })

    verify phone_number_exists(contact_record, number)
  end
end
