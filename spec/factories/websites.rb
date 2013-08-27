# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:website_title) { |n| "website title #{n}" }
  sequence(:website_link)  { |n| "http://www.example.com/#{n}" }

  factory :website do
    title { generate(:website_title) }
    link  { generate(:website_link) }
  end

  factory :contact_form_link, parent: :website, class: ContactFormLink do
    contact

    type { 'ContactFormLink' }
  end

  factory :related_content_link, parent: :website, class: RelatedContentLink do
    contact

    type { 'RelatedContentLink' }
  end
end
