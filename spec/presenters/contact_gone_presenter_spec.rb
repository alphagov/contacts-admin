require "spec_helper"

describe ContactGonePresenter do
  let(:contact) { create :contact }

  it "transforms a contact to the correct format" do
    payload = ContactGonePresenter.new(contact).present

    expect(payload[:base_path]).to eq("/government/organisations/#{contact.organisation.slug}/contact/#{contact.slug}")
    expect(payload[:format]).to eq('gone')
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:update_type]).to eq("major")
    expect(payload[:routes].first[:path]).to eq(payload[:base_path])
  end
end
