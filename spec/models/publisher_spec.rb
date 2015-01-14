require "spec_helper"

describe Contacts::Publisher do
  let!(:presenter) { double("ContactPresenter") }
  let!(:presented_contact) { { base_path: '/base-path', format: 'gone' } }

  it "sends data to the publishing-api on register" do
    presenter.should_receive(:present).and_return(presented_contact)
    Contacts.publishing_api.should_receive(:put_content_item).with('/base-path', presented_contact)

    Contacts::Publisher.publish(presenter)
  end
end
