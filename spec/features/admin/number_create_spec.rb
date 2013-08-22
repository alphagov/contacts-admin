require 'spec_helper'

describe 'Number creation', auth: :user do
  include Admin::NumberSteps

  let(:contact_record) { create :contact_record }
  let(:number)         { build :number, contact_record: contact_record }

  before {
    verify !number_exists(contact_record, number)
  }

  specify 'it can be created' do
    create_number(contact_record, {
      number: number.number,
      title: number.title
    })

    verify number_exists(contact_record, number)
  end
end
