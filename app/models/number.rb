class Number < ActiveRecord::Base
  belongs_to :contact, inverse_of: :numbers

  validates :contact, presence: true
end
