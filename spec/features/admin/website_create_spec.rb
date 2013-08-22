require 'spec_helper'

describe 'Website creation', auth: :user do
  include Admin::WebsiteSteps

  let(:contact_record) { create :contact_record }
  let(:website)        { build :website, contact_record: contact_record }

  before {
    verify !website_exists(contact_record, website)
  }

  specify 'it can be created' do
    create_website(contact_record, {
      link: website.link,
      title: website.title
    })

    verify website_exists(contact_record, website)
  end
end
