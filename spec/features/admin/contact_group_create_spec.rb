require "rails_helper"

feature "Contact Group creation", auth: :user do
  include Admin::ContactGroupSteps

  let(:organisation) { create :organisation }

  let(:contact_group) { build :contact_group }

  before do
    contact_group.organisation = organisation
    verify !contact_group_exists(contact_group)
  end

  specify "it can be created" do
    create_contact_group(
      title: contact_group.title,
      description: contact_group.description,
    )

    verify contact_group_exists(contact_group)
  end
end
