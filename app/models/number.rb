class Number < ActiveRecord::Base
  belongs_to :contact, inverse_of: :numbers

  validates :contact, presence: true
  validates :title, presence: true
  validates :number, presence: true
end
