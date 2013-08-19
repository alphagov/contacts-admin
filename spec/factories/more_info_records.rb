# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:more_info_url) { |n| "http://www.example.com/#{n}.html" }

  factory :more_info_record do
    url { generate(:more_info_url) }
  end
end
