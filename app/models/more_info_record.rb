class MoreInfoRecord < ActiveRecord::Base
  belongs_to :contact_record

  validates :url, presence: true
end
