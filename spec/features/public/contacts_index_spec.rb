require 'spec_helper'

feature "Public Contacts index page" do
  include Public::ContactSteps

  let!(:hmrc)          { create :organisation, :title => "HM Revenue & Customs" }
  let!(:contact)       { create(:contact, :with_phone_numbers, :with_contact_group, title: "General", organisation: hmrc) }
  let!(:contact2)      { create(:contact, :with_phone_numbers, :with_contact_group, organisation: hmrc) }
  let!(:other_contact) { create(:contact, :with_phone_numbers, :with_contact_group) }


  scenario "viewing the contacts" do
    visit "/government/organisations/#{hmrc.slug}/contact"

    should_have_page_heading("HM Revenue & Customs")
    should_have_title("HM Revenue & Customs contacts - GOV.UK")

    should_list_contact(contact)
    should_list_contact(contact2)
  end

  it "should handle filtering using the older parameter name" do
    # This could happen if users followed an old bookmark or link
    visit "/government/organisations/hm-revenue-customs/contact?search%5Bname%5D=general"

    expect(page).to have_link(contact.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    expect(page).to_not have_link(contact2.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact2.slug}")
  end
end
