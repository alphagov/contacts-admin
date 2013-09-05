# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_description) { |n| "contact record description #{n}" }
  sequence(:contact_information) { |n| "contact information #{n}" }
  sequence(:contact_title) { |n| "contact title #{n}" }

  factory :contact do
    contact_group
    department
    title               { generate(:contact_title) }
    description         { generate(:contact_description) }
    contact_information { generate(:contact_information) }
  end
end
