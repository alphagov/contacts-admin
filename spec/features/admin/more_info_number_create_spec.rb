require 'spec_helper'

describe 'More Info Number record creation', auth: :user do
  include Admin::MoreInfoNumberSteps

  let(:contact_record)    { create :contact_record }
  let(:more_info_number) { build :more_info_number, contact_record: contact_record }

  before {
    verify !more_info_record_exists(contact_record)
  }

  specify 'it can be created' do
    create_more_info_number(contact_record, {
      url: more_info_number.url
    })

    verify more_info_record_exists(contact_record)
  end
end
