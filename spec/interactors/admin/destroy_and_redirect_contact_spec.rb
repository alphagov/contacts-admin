require "rails_helper"

describe Admin::DestroyAndRedirectContact do
  describe "#destroy_and_redirect" do
    let(:contact) { create :contact }
    let(:redirect_to_location) { '/foo/bar/baz' }
    subject!(:interactor) { described_class.new(contact, redirect_to_location) }

    it "destroys the contact" do
      subject.destroy_and_redirect

      expect(Contact.exists?(contact.id)).to be_falsey
    end

    it "replaces the item in content store with a redirect item" do
      expect(Services.publishing_api).to receive(:unpublish)
                                           .with(
                                             contact.content_id,
                                             type: 'redirect',
                                             alternative_path: redirect_to_location
                                           )

      subject.destroy_and_redirect
    end
  end
end
