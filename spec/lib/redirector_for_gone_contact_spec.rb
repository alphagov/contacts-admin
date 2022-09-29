require "rails_helper"
require "redirector_for_gone_contact"
require "gds_api/test_helpers/publishing_api"

describe RedirectorForGoneContact do
  let(:gone_content_id) { SecureRandom.uuid }
  let(:redirect_to_location) { "/find-my-nearest/hat-shop" }

  subject(:redirector) do
    RedirectorForGoneContact.new(
      gone_content_id:,
      redirect_to_location:,
    )
  end

  describe "#redirect_gone_contact" do
    it "unpublishes the 'gone' through the Publishing API" do
      expect(
        Services.publishing_api,
      ).to receive(:unpublish)
             .with(
               gone_content_id,
               type: "redirect",
               alternative_path: redirect_to_location,
             )

      subject.redirect_gone_contact
    end
  end
end
