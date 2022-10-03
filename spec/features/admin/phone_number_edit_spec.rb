require "rails_helper"

feature "Phone Number editing", auth: :user do
  include Admin::PhoneNumberSteps

  let!(:contact) { create :contact }
  let!(:number)  { create :phone_number, contact: }

  before { verify phone_number_exists(contact, number) }

  specify "it can be updated" do
    update_phone_number(number, title: "new title")

    verify phone_number_updated(number, title: "new title")
  end
end
