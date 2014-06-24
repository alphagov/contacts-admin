require "spec_helper"

describe Contact do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it "should be registered after saving" do
    contact = create(:contact)

    presenter = double("ContactPresenter")
    ContactPresenter.should_receive(:new).with(contact).and_return(presenter)
    Contacts::RegisterContact.should_receive(:register).with(presenter)

    contact.title = "Winter is coming"
    contact.save
  end
end
