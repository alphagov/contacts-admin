require "spec_helper"

describe ContactGroupsPresenter do
  let(:group) { create :contact_group, :with_contacts }

  it "transforms a contact to the correct format" do
    presented = ContactGroupsPresenter.new([group]).present.first

    expect(presented[:title]).to eq(group.title)
    expect(presented[:organisation]).to eq(group.organisation.as_json)

    govspeak_description = "<p>#{group.description}</p>"
    expect(presented[:description]).to eq(govspeak_description)

    govspeak_description = "<p>#{group.contacts.first.description}</p>"
    expect(presented[:contacts].first[:description]).to eq(govspeak_description)
  end
end
