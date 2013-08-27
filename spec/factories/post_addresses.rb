# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:post_address_title) { |n| "post address title #{n}" }
  sequence(:post_address)       { |n| "post address #{n}" }

  factory :post_address do
    contact

    title   { generate(:post_address_title) }
    address { generate(:post_address) }
  end
end
