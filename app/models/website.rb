class Website < ActiveRecord::Base
  validates :contact_record, presence: true
  validates :title, presence: true
  validates :link, presence: true
end
