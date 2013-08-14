# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    contact_type { ContactType.all.sample }
  end
end
