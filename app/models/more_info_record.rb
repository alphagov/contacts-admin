class MoreInfoRecord < ActiveRecord::Base
  belongs_to :contact_record

  validates :url, presence: true
  validates :contact_record, presence: true
end
