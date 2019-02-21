# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  sequence(:contact_group_title) { |n| "contact group #{n}" }
  sequence(:contact_group_description) { |n| "contact group description #{n}" }

  factory :contact_group do
    contact_group_type

    title          { generate(:contact_group_title) }
    description    { generate(:contact_group_description) }
    organisation

    trait :with_contacts do
      after(:create) do |contact_group|
        contact_group.contacts << FactoryBot.create(:contact)
      end
    end
  end
end
