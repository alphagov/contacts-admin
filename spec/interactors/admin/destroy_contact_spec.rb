require "spec_helper"

describe Admin::DestroyContact do
  describe "#destroy" do
    context "rummager does not throw an error" do
      let(:contact) { create :contact }

      it "destroys the contact" do
        described_class.new(contact).destroy

        expect { contact.reload }.to raise_error
      end
    end
  end
end
