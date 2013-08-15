class Website < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :websites

  validates :contact_record, presence: true
  validates :title, presence: true
  validates :link, presence: true
end
