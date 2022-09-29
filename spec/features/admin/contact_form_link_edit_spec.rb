require "rails_helper"

feature "Contact Form Link editing", auth: :user do
  include Admin::ContactFormLinkSteps

  let!(:contact)           { create :contact }
  let!(:contact_form_link) { create :contact_form_link, contact: }

  before { verify contact_form_link_exists(contact, contact_form_link) }

  specify "it can be updated" do
    update_contact_form_link(contact_form_link, title: "new title")

    verify contact_form_link_updated(contact_form_link, title: "new title")
  end
end
