require 'spec_helper'

describe 'Contact Group removal', auth: :user do
  include Admin::ContactGroupSteps

  let!(:contact_group) { create :contact_group }

  before { verify contact_group_exists(contact_group) }

  specify 'it can be removed' do
    delete_contact_group(contact_group)

    verify !contact_group_exists(contact_group)
  end
end
