class Website < ActiveRecord::Base
  belongs_to :contact, inverse_of: :websites

  validates :contact, presence: true
  validates :title, presence: true
  validates :link, presence: true
end
