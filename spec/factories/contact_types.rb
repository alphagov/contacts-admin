# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_type_title) { |n| "contact type #{n}" }

  factory :contact_type do
    title  { generate(:contact_type_title) }
  end
end
