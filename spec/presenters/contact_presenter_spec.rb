require "spec_helper"

describe ContactPresenter do
  let(:contact) { create :contact }

  it "transforms a contact to the correct format" do
    payload = ContactPresenter.new(contact).present

    expect(payload[:base_path]).to eq("/contact/#{contact.organisation.slug}/#{contact.slug}")
    expect(payload[:title]).to eq(contact.title)
    expect(payload[:description]).to eq(contact.description)
    expect(payload[:format]).to eq('contact')
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:rendering_app]).to eq("contacts-frontend")
    expect(payload[:update_type]).to eq("major")
    expect(payload[:routes].first[:path]).to eq(payload[:base_path])
    expect(payload[:public_updated_at]).to be_present
    expect(payload[:need_ids]).to be_empty

    details = payload[:details]
    expect(details[:slug]).to eq(contact.slug)
    expect(details[:title]).to eq(contact.title)
    expect(details[:description]).to eq(contact.description)
    expect(details[:quick_links]).to eq(contact.quick_links.map {|q| {title: q.title, url: q.url} })
    expect(details[:contact_form_links]).to eq(contact.contact_form_links.map(&:as_json))
    expect(details[:more_info_email_address]).to eq(contact.more_info_email_address)
  end
end
