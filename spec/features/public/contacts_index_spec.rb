require 'spec_helper'

describe "Contacts index page" do
  let!(:hmrc)          { create :organisation, :title => "HM Revenue & Customs" }
  let!(:contact)       { create(:contact, :with_phone_numbers, :with_contact_group, title: "General", organisation: hmrc) }
  let!(:contact2)      { create(:contact, :with_phone_numbers, :with_contact_group, organisation: hmrc) }
  let!(:other_contact) { create(:contact, :with_phone_numbers, :with_contact_group) }


  it "should render the index page with contacts" do
    visit "/government/organisations/#{hmrc.slug}/contact"

    expect(page).to have_content("HM Revenue & Customs")

    expect(page).to have_link(contact.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    expect(page).to have_link(contact2.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact2.slug}")
  end

  it "should handle filtering using the older parameter name" do
    # This could happen if users followed an old bookmark or link
    visit "/government/organisations/hm-revenue-customs/contact?search%5Bname%5D=general"

    expect(page).to have_link(contact.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    expect(page).to_not have_link(contact2.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact2.slug}")
  end
end
