class PhoneNumber < ActiveRecord::Base
  belongs_to :contact, inverse_of: :phone_numbers, counter_cache: true

  validates :contact, presence: true
  validates :title, presence: true
  validates :number, presence: true
end
