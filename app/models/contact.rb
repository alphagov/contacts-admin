class Contact < ActiveRecord::Base
  belongs_to :contact_record
  belongs_to :department

  validates :title, presence: true
  validates :contact_record, presence: true
  validates :department, presence: true

  def to_s
    title
  end
end
