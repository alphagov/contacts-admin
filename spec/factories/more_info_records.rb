# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:more_info_url) { |n| "http://www.example.com/#{n}.html" }

  factory :more_info_record do
    contact_record

    url { generate(:more_info_url) }
  end

  factory :more_info_website, parent: :more_info_record do
    type { 'MoreInfoWebsite' }
  end

  factory :more_info_email_address, parent: :more_info_record do
    type { 'MoreInfoEmailAddress' }
  end

  factory :more_info_post_address, parent: :more_info_record do
    type { 'MoreInfoPostAddress' }
  end

  factory :more_info_number, parent: :more_info_record do
    type { 'MoreInfoNumber' }
  end
end
