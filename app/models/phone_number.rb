class PhoneNumber < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :phone_numbers, counter_cache: true

  validates :contact_record, presence: true
  validates :title, presence: true
  validates :number, presence: true
end
