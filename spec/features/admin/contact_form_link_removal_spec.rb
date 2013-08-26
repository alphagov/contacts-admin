require 'spec_helper'

describe 'Contact Form Link removal', auth: :user do
  include Admin::ContactFormLinkSteps

  let!(:contact_record)    { create :contact_record }
  let!(:contact_form_link) { create :contact_form_link, contact_record: contact_record  }

  before { verify contact_form_link_exists(contact_record, contact_form_link) }

  specify 'it can be removed' do
    delete_contact_form_link(contact_form_link)

    verify !contact_form_link_exists(contact_record, contact_form_link)
  end
end
