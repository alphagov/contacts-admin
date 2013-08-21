require 'spec_helper'

describe 'More Info Website record creation', auth: :user do
  include Admin::MoreInfoWebsiteSteps

  let(:contact_record)    { create :contact_record }
  let(:more_info_website) { build :more_info_website, contact_record: contact_record }

  before {
    verify !more_info_record_exists(contact_record)
  }

  specify 'it can be created' do
    create_more_info_website(contact_record, {
      url: more_info_website.url
    })

    verify more_info_record_exists(contact_record)
  end
end
