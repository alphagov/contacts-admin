require "spec_helper"

describe ContactGonePresenter do
  let(:contact) { create :contact }

  it "transforms a contact to the correct format" do
    payload = ContactGonePresenter.new(contact).present

    expect(payload[:format]).to eq('gone')
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:update_type]).to eq("major")
    expect(payload[:routes].first[:path]).to eq(contact.link)
  end
end
