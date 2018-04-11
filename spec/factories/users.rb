# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  sequence(:user_name)  { |n| "user name #{n}" }
  sequence(:user_email) { |n| "user#{n}@example.com" }

  factory :user do
    name  { generate(:user_name) }
    email { generate(:user_email) }
  end
end
