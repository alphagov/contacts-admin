shared_context "an associated data model" do
  it "registers its parent contact on save" do
    presenter = ContactPresenter.new(item.contact)

    ContactPresenter.should_receive(:new).with(item.contact).and_return(presenter)
    Publisher.should_receive(:publish).with(presenter)

    item.title = "Winter is coming"
    item.save
  end
end
