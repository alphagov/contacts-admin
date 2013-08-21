require 'spec_helper'

describe 'More Info number editing', auth: :user do
  include Admin::MoreInfoNumberSteps

  let!(:contact_record)        { create :contact_record }
  let!(:more_info_number)     { create :more_info_number, contact_record: contact_record }
  let(:new_url)               { 'http://www.example.com/new_url' }

  before {
    verify more_info_record_exists(contact_record)
  }

  specify 'it can be updated' do
    update_more_info_number(contact_record, {
      url: new_url
    })

    verify more_info_number_updated(contact_record, url: new_url)
  end
end
