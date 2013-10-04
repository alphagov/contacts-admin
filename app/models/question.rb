class Question < ActiveRecord::Base
  include Versioning

  belongs_to :contact, inverse_of: :questions
  belongs_to :contact_group, inverse_of: :questions

  validates :title, presence: true
  validates :contact, presence: true
  validates :contact_group, presence: true
end
