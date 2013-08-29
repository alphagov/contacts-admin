require 'spec_helper'

describe 'Contact group edit', auth: :user do
  include Admin::ContactGroupSteps

  let(:contact_group) { create :contact_group  }

  before { verify contact_group_exists(contact_group) }

  specify 'it can be updated' do
    update_contact_group(
      contact_group,
      description: 'new description'
    )

    verify contact_group_updated(
      contact_group,
      description: 'new description'
    )
  end
end
