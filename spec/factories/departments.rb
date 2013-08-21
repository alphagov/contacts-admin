# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:department_title) { |n| "department #{n}" }

  factory :department do
    title  { generate(:department_title) }
  end
end
