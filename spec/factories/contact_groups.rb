# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_group_title) { |n| "contact group #{n}" }

  factory :contact_group do
    title  { generate(:contact_group_title) }
  end
end
