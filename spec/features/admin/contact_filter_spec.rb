require "rails_helper"

feature "Contact filtering", auth: :user do
  include Admin::ContactSteps

  let!(:organisation) { create(:organisation, title: "Department of Trance", abbreviation: "DoT") }
  let!(:dot_contact) { create(:contact, title: "Entranced", organisation:) }
  let!(:other_contact) { create(:contact, title: "Mellowed") }

  scenario "filtering by organisation" do
    visit "/admin/contacts"

    should_list_contact("Entranced")
    should_list_contact("Mellowed")

    filter_by_organisation("Department of Trance [DoT]")
    submit_filter_form

    should_list_contact("Entranced")
    should_not_list_contact("Mellowed")
  end

  scenario "filtering by title" do
    visit "/admin/contacts"

    should_list_contact("Entranced")
    should_list_contact("Mellowed")

    filter_by_title_or_description("trance")
    submit_filter_form

    should_list_contact("Entranced")
    should_not_list_contact("Mellowed")
  end
end
