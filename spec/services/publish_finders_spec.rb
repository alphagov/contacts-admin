require "rails_helper"

RSpec.describe PublishFinders do
  before do
    @hmrc_contacts_content_id = PublishFinders::HMRC_CONTACTS_CONTENT_ID
    @hmrc_contacts_finder = PublishFinders.new.send(:hmrc_contacts_payload)
    @hmrc_contacts_parent = PublishFinders.new.send(:hmrc_contacts_parent)
  end

  it "publishes the HMRC contacts finder" do
    PublishFinders.call

    assert_publishing_api_put_content(
      @hmrc_contacts_content_id,
      @hmrc_contacts_finder,
    )
    assert_publishing_api_publish(
      @hmrc_contacts_content_id,
    )
    assert_publishing_api_patch_links(
      @hmrc_contacts_content_id,
      links: @hmrc_contacts_parent,
    )
  end
end
