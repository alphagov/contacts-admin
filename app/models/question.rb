class Question < ActiveRecord::Base
  belongs_to :contact, inverse_of: :questions

  validates :title, presence: true
  validates :contact, presence: true
end
