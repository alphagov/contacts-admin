class Contact < ActiveRecord::Base
  belongs_to :contact_record

  validates :title, presence: true
end
