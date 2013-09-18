require 'spec_helper'

describe 'Contact removal', auth: :user do
  include Admin::ContactSteps

  let!(:contact) { create :contact }

  before { verify contact_exists(contact) }

  specify 'it can be removed' do
    RUMMAGER_INDEX.stub(:delete) { true }

    delete_contact(contact)

    verify !contact_exists(contact)
  end
end
