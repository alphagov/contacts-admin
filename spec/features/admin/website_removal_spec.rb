require 'spec_helper'

describe 'Website removal', auth: :user do
  include Admin::WebsiteSteps

  let!(:contact_record) { create :contact_record }
  let!(:website)        { create :website, contact_record: contact_record  }

  before { verify website_exists(contact_record, website) }

  specify 'it can be removed' do
    delete_website(website)

    verify !website_exists(contact_record, website)
  end
end
