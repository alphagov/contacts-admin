require "rails_helper"

feature "Contact editing", auth: :user do
  include Admin::ContactSteps

  let!(:contact_group) { create(:contact_group, title: "new contact type") }
  let!(:contact)       { create :contact }

  specify "it can be updated" do
    update_contact(
      contact,
      title: "new title",
      description: "new description",
      quick_link_1: "https://www.gov.uk/",
      quick_link_title_1: "GOV.UK",
      popularity: 2,
    ) do
      select contact_group.to_s, from: "contact_contact_group_ids"
    end

    verify contact_updated(
      contact,
      title: "new title",
      description: "new description",
      quick_link_1: "https://www.gov.uk/",
      quick_link_title_1: "GOV.UK",
      popularity: 2,
    )
    verify associated_to_contact_group(contact, contact_group)
  end

  specify "updating a contact sends the data to the publishing-api" do
    update_contact(
      contact,
      title: "new title",
      description: "new description",
    )

    assert_publishing_api_put_content(contact.content_id, request_json_includes(title: "new title", description: "new description"))
  end

private

  def can_update_more_info_from_tab(contact, tab, attribute_name)
    ensure_on url_for([:admin, contact, tab])

    fill_in "contact_#{attribute_name}", with: "More info details."
    click_on "Update"

    expect(page.current_url).to eq(url_for([:admin, contact, tab]))
    expect(page).to have_field("contact_#{attribute_name}", with: "More info details.")
  end
end
