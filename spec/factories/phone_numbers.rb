# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:number_title) { |n| "post address title #{n}" }
  sequence(:phone_number) { |n| "555-#{n}#{n}#{n}-#{n}#{n}#{n}#{n}#{n}" }

  factory :phone_number do
    contact

    title  { generate(:number_title) }
    number { generate(:phone_number) }
  end
end
