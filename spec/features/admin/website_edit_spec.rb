require 'spec_helper'

describe 'Website editing', auth: :user do
  include Admin::WebsiteSteps

  let!(:contact_record) { create :contact_record }
  let!(:website)        { create :website, contact_record: contact_record  }

  before { verify website_exists(contact_record, website) }

  specify 'it can be updated' do
    update_website(website, title: 'new title')

    verify website_updated(website, title: 'new title')
  end
end
