class PhoneNumber < ActiveRecord::Base
  include Versioning

  belongs_to :contact, inverse_of: :phone_numbers, counter_cache: true

  validates :contact, presence: true
  validates :title, presence: true
  validates :number, presence: true

  def number_options_path
    self[:number_options_path].to_s.split(",")
  end

  def international_number_options_path
    self[:international_number_options_path].to_s.split(",")
  end
end
