class Number < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :numbers

  validates :contact_record, presence: true
  validates :title, presence: true
  validates :number, presence: true
end
