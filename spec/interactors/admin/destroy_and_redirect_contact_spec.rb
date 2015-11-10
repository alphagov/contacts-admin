require "spec_helper"

describe Admin::DestroyAndRedirectContact do
  describe "#destroy_and_redirect" do
    let(:contact) { create :contact }
    let(:redirect_to_location) { '/foo/bar/baz' }
    subject!(:interactor) { described_class.new(contact, redirect_to_location) }

    it 'removes the item from rummager' do
      ::Contacts.rummager_client.
        should_receive(:delete_document).
        with("contact", contact.link.gsub(%r{^/},''))

      subject.destroy_and_redirect
    end

    context "rummager does not throw an error" do
      before do
        stub_any_rummager_delete
      end

      it "destroys the contact" do
        subject.destroy_and_redirect

        expect(Contact.exists?(contact.id)).to be_false
      end

      it "replaces the item in content store with a redirect item" do
        ::Contacts.publishing_api.
          should_receive(:put_content_item).
          with(
            contact.link,
            hash_including(
              format: 'redirect',
              redirects: [
                hash_including(
                  destination: redirect_to_location
                )
              ]
            )
          )

        subject.destroy_and_redirect
      end
    end
  end
end
