require "spec_helper"

describe ContactGroupsPresenter do
  let(:group) { create :contact_group, :with_contacts }

  it "transforms a contact to the correct format" do
    presented = ContactGroupsPresenter.new([group]).present.first

    presented[:title].should eq(group.title)
    presented[:organisation].should eq(group.organisation.as_json)

    govspeak_description = "<p>#{group.description}</p>"
    presented[:description].should eq(govspeak_description)

    govspeak_description = "<p>#{group.contacts.first.description}</p>"
    presented[:contacts].first[:description].should eq(govspeak_description)
  end
end
