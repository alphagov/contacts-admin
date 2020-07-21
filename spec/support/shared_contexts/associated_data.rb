shared_context "an associated data model" do
  it "registers its parent contact on save" do
    presenter = ContactPresenter.new(item.contact)

    expect(ContactPresenter).to receive(:new).with(item.contact).and_return(presenter)
    expect(Publisher).to receive(:publish).with(presenter)

    item.title = "Winter is coming"
    item.save!
  end
end
