# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_group_type_title) { |n| "contact group type #{n}" }

  factory :contact_group_type do
    title { generate(:contact_group_type_title) }
  end
end
