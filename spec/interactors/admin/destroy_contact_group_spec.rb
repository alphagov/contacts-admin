require "rails_helper"

describe Admin::DestroyContactGroup do
  describe "#destroy" do
    context "contact group has any contacts associated" do
      let(:contact_group) { create :contact_group, :with_contacts }

      it "does not destroy the contact group" do
        described_class.new(contact_group).destroy

        expect(contact_group.reload).to be_present
      end
    end

    context "contact group has no contacts associated" do
      let(:contact_group) { create :contact_group }

      it "destroys the contact group" do
        described_class.new(contact_group).destroy

        expect { contact_group.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
