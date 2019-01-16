# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :organisation do
    sequence(:title) { |n| "Organisation #{n}" }
    slug { title.parameterize }
    format { "Non-ministerial department" }
    sequence(:abbreviation) { |n| "ORG#{n}" }
    govuk_status { "live" }
    content_id { |_n| SecureRandom.uuid }
    contact_index_content_id { SecureRandom.uuid }
  end
end
