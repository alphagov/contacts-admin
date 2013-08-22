require 'spec_helper'

describe 'Number editing', auth: :user do
  include Admin::NumberSteps

  let!(:contact_record) { create :contact_record }
  let!(:number)        { create :number, contact_record: contact_record  }

  before { verify number_exists(contact_record, number) }

  specify 'it can be updated' do
    update_number(number, title: 'new title')

    verify number_updated(number, title: 'new title')
  end
end
