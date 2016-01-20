# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:website_title) { |n| "website title #{n}" }
  sequence(:website_link)  { |n| "http://www.example.com/#{n}" }
  sequence(:contact_form_link_description) { |n| "* contact form link description #{n}" }

  factory :website do
    title { generate(:website_title) }
    link  { generate(:website_link) }
  end

  factory :contact_form_link, parent: :website, class: ContactFormLink do
    description { generate(:contact_form_link_description) }
    contact
  end
end
