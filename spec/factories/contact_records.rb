# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_record_description) { |n| "contact record description #{n}" }

  factory :contact_record do
    contact_type

    description { generate(:contact_record_description) }
  end
end
