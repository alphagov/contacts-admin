require "spec_helper"

describe ContactRummagerPresenter do
  it "should generate a Rummager format" do
    organisation = create(:organisation, slug: 'bowie')
    contact = create(:contact,
                      :with_contact_group,
                      title: "Major Tom",
                      description: "Back to Earth",
                      organisation: organisation)

    expected = {
      title:             "Major Tom",
      description:       "Back to Earth",
      link:              "/government/organisations/bowie/contact/major-tom",
      format:            'contact',
      indexable_content: "Major Tom Back to Earth #{contact.contact_groups.first.title}",
      organisations:     ['bowie'],
      public_timestamp:  contact.updated_at.iso8601,
    }

    expect(ContactRummagerPresenter.new(contact).present).to eql(expected)
  end
end
