require "spec_helper"

describe ContactPresenter do
  let(:contact) { create :contact }

  it "transforms a contact to the correct format" do
    payload = ContactPresenter.new(contact).present

    payload[:base_path].should eq("/contact/#{contact.organisation.slug}/#{contact.slug}")
    payload[:title].should eq(contact.title)
    payload[:description].should eq(contact.description)
    payload[:format].should eq('contact')
    payload[:publishing_app].should eq("contacts")
    payload[:rendering_app].should eq("contacts-frontend")
    payload[:update_type].should eq("major")
    payload[:routes].first[:path].should eq(payload[:base_path])
    payload[:public_updated_at].should be_present
    payload[:need_ids].should be_empty

    details = payload[:details]
    details[:slug].should eq(contact.slug)
    details[:title].should eq(contact.title)
    details[:description].should eq(contact.description)
    details[:quick_links].should eq(contact.quick_links.map {|q| {title: q.title, url: q.url} })
    details[:contact_form_links].should eq(contact.contact_form_links.map(&:as_json))
    details[:more_info_email_address].should eq(contact.more_info_email_address)
  end
end
