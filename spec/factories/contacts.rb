# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_title) { |n| "contact title #{n}" }

  factory :contact do
    title { generate(:title)  }
  end
end
