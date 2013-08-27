# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_description) { |n| "contact record description #{n}" }
  sequence(:contact_information) { |n| "contact information #{n}" }

  factory :contact do
    contact_type

    description { generate(:contact_description) }
    contact_information { generate(:contact_information) }
  end
end
