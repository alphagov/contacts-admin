# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  sequence(:email_address_title) { |n| "email address title #{n}" }
  sequence(:email_address)       { |n| "email#{n}@example.com" }

  factory :email_address do
    contact

    title { generate(:email_address_title) }
    email { generate(:email_address) }
  end
end
