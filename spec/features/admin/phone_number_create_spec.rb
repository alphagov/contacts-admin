require "rails_helper"

feature "Phone Number creation", auth: :user do
  include Admin::PhoneNumberSteps

  let(:contact) { create :contact }
  let(:number)  { build :phone_number, contact: }

  before do
    verify !phone_number_exists(contact, number)
  end

  specify "it can be created" do
    create_phone_number(
      contact,
      number: number.number,
      title: number.title,
    )

    verify phone_number_exists(contact, number)
  end
end
