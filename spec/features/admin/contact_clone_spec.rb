require "spec_helper"

feature "Contact cloning", auth: :user do
  specify "it can be cloned" do
    contact = create(:contact)
    visit edit_admin_contact_path(contact)

    expect {
      click_on 'Clone'
    }.to change { Contact.count }.by(1)

    cloned_contact = Contact.last

    assert_publishing_api_put_links(
      cloned_contact.content_id,
      { links: { organisations: [cloned_contact.organisation.content_id] } }
    )
  end
end
