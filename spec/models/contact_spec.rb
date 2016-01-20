require "spec_helper"

describe Contact do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it "should be registered after saving" do
    contact = build(:contact)
    presenter = ContactPresenter.new(contact)

    ContactPresenter.should_receive(:new).with(contact).and_return(presenter)
    Publisher.should_receive(:publish).with(presenter)

    contact.save
  end

  it "should be in rummager after being created" do
    contact = create(:contact)

    expected_json = JSON.parse(ContactRummagerPresenter.new(contact).present.to_json)
    assert_rummager_posted_item(expected_json)
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
end
