shared_context "an associated data model" do
  it "registers its parent contact on save" do
    presenter = double("ContactPresenter")
    expect(ContactPresenter).to receive(:new).with(item.contact).and_return(presenter)
    expect(Contacts::RegisterContact).to receive(:register).with(presenter)

    item.title = "Winter is coming"
    item.save
  end
end
