class Question < ActiveRecord::Base
  include Versioning

  belongs_to :contact, inverse_of: :questions

  validates :title, presence: true
  validates :contact, presence: true
end
