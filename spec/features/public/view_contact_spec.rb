require "spec_helper"

describe "Contact view" do
  let!(:contact) { create :contact }
  let(:visit_contact) { visit contact_path(contact.department, contact) }

  it "contact's general info" do
    visit_contact

    page.should have_content(contact.title)

    (1..3).each do |i|
      title = contact.send("quick_link_title_#{i}")
      href = contact.send("quick_link_#{i}")
      page.should have_link(title, href: href)
    end
  end

  describe "query response time" do
    query_text = "Find out when to expect a response to your query"

    it "should be shown" do
      contact.update query_response_time: true
      visit_contact
      page.should have_content(query_text)
    end

    it "should be hidden" do
      visit_contact
      page.should_not have_content(query_text)
    end
  end

  it "should list all contact form links" do
    (1..3).map { contact.contact_form_links << create(:contact_form_link) }

    visit_contact

    contact.contact_form_links.each do |link|
      page.should have_link(link.title, href: link.link)
    end
  end

  it "should list all emails" do
    (1..3).map { contact.email_addresses << create(:email_address) }

    visit_contact

    contact.email_addresses.each do |email|
      page.should have_content(email.title)
      page.should have_link(email.email, href: "mailto:#{email.email}")
    end
  end

  it "should list phone numbers" do
    (1..3).map { contact.phone_numbers << create(:phone_number) }

    visit_contact

    contact.phone_numbers.each do |number|
      page.should have_content(number.number)
    end
  end

  it "should list addresses" do
    (1..3).map { contact.post_addresses << create(:post_address) }

    visit_contact

    contact.post_addresses.each do |address|
      [:title, :description, :address, :street_address, :postal_code].each do |field|
        page.should have_content(address.send(field))
      end
    end
  end
end
