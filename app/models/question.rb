class Question < ActiveRecord::Base
  belongs_to :office, inverse_of: :questions

  validates :title, presence: true
  validates :office, presence: true
end
