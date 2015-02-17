shared_context "an associated data model" do
  it "registers its parent contact on save" do
    ::Contacts.publishing_api.should_receive(:put_content_item)
                             .with(item.contact.link, hash_including(:content_id))
                             .at_least(1)

    item.title = "Winter is coming"
    item.save
  end
end
