# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_group_title) { |n| "contact group #{n}" }
  sequence(:contact_group_description) { |n| "contact group description #{n}" }

  factory :contact_group do
    contact_group_type

    title  { generate(:contact_group_title) }
    description { generate(:contact_group_description) }
  end
end
