require "rails_helper"

RSpec.describe Contact, type: :model do
  let(:item) { create(:contact) }
  it_behaves_like "a versioned data model"

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }

  it "should be registered after saving" do
    contact = build(:contact)
    presenter = ContactPresenter.new(contact)

    expect(ContactPresenter).to receive(:new).with(contact).and_return(presenter)
    expect(Publisher).to receive(:publish).with(presenter)

    contact.save!
  end

  context "content ID" do
    it "should be set on a new contact" do
      contact = build(:contact)
      contact.valid?
      expect(contact.content_id).to be_present
    end

    it "should not be overridden if specified" do
      content_id = SecureRandom.uuid

      contact = build(:contact, content_id:)
      contact.valid?
      expect(contact.content_id).to eq(content_id)
    end

    it "should not be modifiable on an existing contact" do
      contact = create(:contact)

      new_content_id = SecureRandom.uuid
      expect { contact.update(content_id: new_content_id) }.to raise_error(ActiveRecord::ReadonlyAttributeError)
      expect(contact.content_id).to_not eq(new_content_id)
    end
  end

  describe "#organisation" do
    it "can be set on create" do
      contact = create(:contact, organisation: create(:organisation))

      expect(contact).to be_valid
    end

    it "can not be changed" do
      contact = create(:contact)

      contact.organisation = create(:organisation)

      expect(contact).not_to be_valid
    end

    it "can not be changed via `organisation_id`" do
      contact = create(:contact)

      contact.organisation_id = 1212

      expect(contact).not_to be_valid
    end
  end
end
