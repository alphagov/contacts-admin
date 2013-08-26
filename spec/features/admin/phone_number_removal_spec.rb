require 'spec_helper'

describe 'Phone Number removal', auth: :user do
  include Admin::PhoneNumberSteps

  let!(:contact_record) { create :contact_record }
  let!(:number)         { create :phone_number, contact_record: contact_record  }

  before { verify phone_number_exists(contact_record, number) }

  specify 'it can be removed' do
    delete_phone_number(number)

    verify !phone_number_exists(contact_record, number)
  end
end
