require "spec_helper"

describe Contact do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it "should be registered after saving" do
    contact = create(:contact)

    presenter = double("ContactPresenter")
    ContactPresenter.should_receive(:new).with(contact).and_return(presenter)
    Contacts::Publisher.should_receive(:publish).with(presenter)

    contact.save
  end

  context "content ID" do

    it "should be set on a new contact" do
      contact = build(:contact)
      contact.valid?
      expect(contact.content_id).to be_present
    end

    it "should not be overridden if specified" do
      content_id = SecureRandom.uuid

      contact = build(:contact, content_id: content_id)
      contact.valid?
      expect(contact.content_id).to eq(content_id)
    end

    it "should not be modifiable on an existing contact" do
      contact = create(:contact)

      # The way `attr_readonly` works is to silently throw away any changes to
      # the read-only field, but not to revert the value on the instance, so to
      # test it we need to go all the way through to the database.
      expect {
        contact.content_id = SecureRandom.uuid
        contact.save!
        contact.reload
      }.not_to change { contact.content_id }
    end
  end

  describe "to_indexed_json" do
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
        last_update:       contact.updated_at,
      }

      expect(contact.to_indexed_json).to eql(expected)
    end
  end
end
