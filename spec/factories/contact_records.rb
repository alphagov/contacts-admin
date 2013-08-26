# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_record_description) { |n| "contact record description #{n}" }
  sequence(:contact_information) { |n| "contact information #{n}" }

  factory :contact_record do
    contact_type

    description { generate(:contact_record_description) }
    contact_information { generate(:contact_information) }
  end
end
