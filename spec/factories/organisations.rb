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

  trait :for_hmrc do
    title { "HM Revenues & Customs" }
    abbreviation { "HMRC" }
    content_id { "6667cce2-e809-4e21-ae09-cb0bdc1ddda3" }
    contact_index_content_id { "b110c03c-3f8d-4327-906b-17ebd872e6a6" }
  end
end
