require 'spec_helper'

describe 'Contact Form Link creation', auth: :user do
  include Admin::ContactFormLinkSteps

  let(:contact_record) { create :contact_record }
  let(:contact_form_link)        { build :contact_form_link, contact_record: contact_record }

  before {
    verify !contact_form_link_exists(contact_record, contact_form_link)
  }

  specify 'it can be created' do
    create_contact_form_link(contact_record, {
      link: contact_form_link.link,
      title: contact_form_link.title
    })

    verify contact_form_link_exists(contact_record, contact_form_link)
  end
end
