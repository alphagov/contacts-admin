require 'spec_helper'

describe 'Contact editing', auth: :user do
  include Admin::ContactSteps

  let!(:contact_group) { create(:contact_group, title: 'new contact type') }
  let!(:contact)        { create :contact }

  before { Contact.count.should eq(1) }

  specify 'it can be updated' do
    update_contact(
      contact,
      title: 'new title',
      description: 'new description',
      more_info_contact_form: 'more info contact form entry',
      more_info_phone_number: 'more info phone number entry'
    ) do
      select contact_group, from: 'contact_contact_group_ids'
    end

    verify contact_updated(
      contact,
      title: 'new title',
      description: 'new description',
      more_info_contact_form: 'more info contact form entry',
      more_info_phone_number: 'more info phone number entry'
    )
    verify associated_to_contact_group(contact, contact_group)
  end
end
