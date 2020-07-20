require "rails_helper"

describe Admin::DestroyContact do
  describe "#destroy" do
    let(:contact) { create :contact }

    it "destroys the contact" do
      described_class.new(contact).destroy!

      expect { contact.reload }.to raise_error ActiveRecord::RecordNotFound
    end

    it "should replace the item in content store with a gone item" do
      expect(Services.publishing_api).to receive(:unpublish)
                                           .with(contact.content_id, type: "gone")

      described_class.new(contact).destroy!
    end
  end
end
