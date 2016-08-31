require "spec_helper"

feature "Phone Number removal", auth: :user do
  include Admin::PhoneNumberSteps

  let!(:contact) { create :contact }
  let!(:number)  { create :phone_number, contact: contact }

  before { verify phone_number_exists(contact, number) }

  specify "it can be removed" do
    delete_phone_number(number)

    verify !phone_number_exists(contact, number)
  end
end
