# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:contact_description) { |n| "contact record description #{n}" }
  sequence(:contact_information) { |n| "contact information #{n}" }
  sequence(:contact_title) { |n| "contact title #{n}" }
  sequence(:quick_link) { |n| "http://link_#{n}.com" }
  sequence(:quick_link_title) { |n| "link #{n}" }
  sequence(:govspeak) { |n| "* something about #{n}" }

  factory :contact do
    title               { generate(:contact_title) }
    description         { generate(:contact_description) }
    contact_information { generate(:contact_information) }
    quick_link_1        { generate(:quick_link) }
    quick_link_title_1  { generate(:quick_link_title) }
    quick_link_2        { generate(:quick_link) }
    quick_link_title_2  { generate(:quick_link_title) }
    quick_link_3        { generate(:quick_link) }
    quick_link_title_3  { generate(:quick_link_title) }
    more_info_phone_number { generate(:govspeak) }
    more_info_email_address { generate(:govspeak) }
    organisation

    trait :with_contact_group do
      after(:create) do |contact|
        contact.contact_groups << FactoryGirl.create(:contact_group, organisation: contact.organisation)
      end
    end
    trait :with_contact_form_links do
      after(:create) do |contact|
        contact.contact_form_links << FactoryGirl.create(:contact_form_link, contact_id: contact.id)
      end
    end
    trait :with_post_addresses do
      after(:create) do |contact|
        contact.post_addresses << FactoryGirl.create(:post_address, contact_id: contact.id)
      end
    end
    trait :with_phone_numbers do
      after(:create) do |contact|
        contact.phone_numbers << FactoryGirl.create(:phone_number, contact_id: contact.id)
      end
    end
    trait :with_email_addresses do
      after(:create) do |contact|
        contact.email_addresses << FactoryGirl.create(:email_address, contact_id: contact.id)
      end
    end
  end
end
