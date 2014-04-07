# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do
    title "HM Revenue & Customs"
    format "Non-ministerial department"
    slug "hm-revenue-customs"
    abbreviation "HMRC"
    govuk_status "live"
  end
end
