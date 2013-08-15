# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:website_title) { |n| "website title #{n}" }
  sequence(:website_link)  { |n| "http://www.example.com/#{n}" }

  factory :website do
    contact_record

    title { generate(:website_title) }
    link  { generate(:website_link) }
  end
end
