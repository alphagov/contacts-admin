require "rails_helper"

feature "Contact Form Link creation", auth: :user do
  include Admin::ContactFormLinkSteps

  let(:contact)           { create :contact }
  let(:contact_form_link) { build :contact_form_link, contact: contact }

  before {
    verify !contact_form_link_exists(contact, contact_form_link)
  }

  specify "it can be created" do
    create_contact_form_link(contact,
                             link: contact_form_link.link,
                             title: contact_form_link.title,
                             description: contact_form_link.description,)

    verify contact_form_link_exists(contact, contact_form_link)
  end
end
