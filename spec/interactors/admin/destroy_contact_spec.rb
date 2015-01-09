require "spec_helper"

describe Admin::DestroyContact do
  describe "#destroy" do
    context "rummager does not throw an error" do
      let(:contact) { create :contact }

      it "destroys the contact" do
        described_class.new(contact).destroy

        expect { contact.reload }.to raise_error
      end

      it "should replace the item in content store with a gone item" do
        presenter = double("ContactGonePresenter")
        ContactGonePresenter.should_receive(:new).with(contact).and_return(presenter)
        Contacts::Publisher.should_receive(:publish).with(presenter)

        described_class.new(contact).destroy
      end
    end
  end
end
