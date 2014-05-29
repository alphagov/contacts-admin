# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do
    sequence(:title) { |n| "Organisation #{n}" }
    slug { title.parameterize }
    format "Non-ministerial department"
    sequence(:abbreviation) { |n| "ORG#{n}" }
    govuk_status "live"
  end
end
