# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:department_title) { |n| "department #{n}" }
  sequence(:department_logo_name) { |n| "department <br> #{n}" }

  factory :department do
    title { generate(:department_title) }
    logo_name { generate(:department_logo_name) }
  end
end
