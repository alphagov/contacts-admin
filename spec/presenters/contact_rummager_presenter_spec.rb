require "spec_helper"

describe ContactRummagerPresenter do
  it "should generate a Rummager format" do
    contact = create(:contact,
                      :with_contact_group,
                      title: "Major Tom",
                      description: "Back to Earth")
    expected = {
      title:             "Major Tom",
      description:       "Back to Earth",
      link:              "/government/organisations/#{contact.organisation.slug}/contact/major-tom",
      format:            'contact',
      indexable_content: "Major Tom Back to Earth #{contact.contact_groups.first.title}",
      public_timestamp:  contact.updated_at,
    }

    expect(ContactRummagerPresenter.new(contact).present).to eql(expected)
  end
end
