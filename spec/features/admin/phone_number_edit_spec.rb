require 'spec_helper'

describe 'Phone Number editing', auth: :user do
  include Admin::PhoneNumberSteps

  let!(:contact_record) { create :contact_record }
  let!(:number)         { create :phone_number, contact_record: contact_record  }

  before { verify phone_number_exists(contact_record, number) }

  specify 'it can be updated' do
    update_phone_number(number, title: 'new title')

    verify phone_number_updated(number, title: 'new title')
  end
end
