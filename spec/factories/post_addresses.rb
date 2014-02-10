# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:post_address_title) { |n| "post address title #{n}" }
  sequence(:street_address)       { |n| "post address #{n}" }
  sequence(:postal_code)       { |n| "SW1A #{n}PW" }

  factory :post_address do
    contact

    title   { generate(:post_address_title) }
    street_address { generate(:street_address) }
    postal_code { generate(:postal_code) }
    world_location_slug { "united-kingdom" }
  end
end
