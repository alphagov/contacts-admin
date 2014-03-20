require "spec_helper"

describe Admin::DestroyContact do
  describe "#destroy" do
    context "rummager throws an error" do
      let(:contact) { create :contact }

      it "does not destroy the contact" do
        described_class.new(contact).destroy

        expect(contact.reload).to be_present
      end
    end

    context "rummager does not throw an error" do
      let(:contact) { create :contact }

      it "destroys the contact" do
        Contacts.rummager_client.stub(:delete) { true }

        described_class.new(contact).destroy

        expect { contact.reload }.to raise_error
      end
    end
  end
end
