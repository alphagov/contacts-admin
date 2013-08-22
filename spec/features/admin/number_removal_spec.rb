require 'spec_helper'

describe 'Number removal', auth: :user do
  include Admin::NumberSteps

  let!(:contact_record) { create :contact_record }
  let!(:number)        { create :number, contact_record: contact_record  }

  before { verify number_exists(contact_record, number) }

  specify 'it can be removed' do
    delete_number(number)

    verify !number_exists(contact_record, number)
  end
end
