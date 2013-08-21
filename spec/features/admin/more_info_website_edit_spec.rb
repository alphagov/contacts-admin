require 'spec_helper'

describe 'More Info website editing', auth: :user do
  include Admin::MoreInfoWebsiteSteps

  let!(:contact_record)        { create :contact_record }
  let!(:more_info_website)     { create :more_info_website, contact_record: contact_record }
  let(:new_url)               { 'http://www.example.com/new_url' }

  before {
    verify more_info_record_exists(contact_record)
  }

  specify 'it can be updated' do
    update_more_info_website(contact_record, {
      url: new_url
    })

    verify more_info_website_updated(contact_record, url: new_url)
  end
end
