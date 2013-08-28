class ContactGroup < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :contacts
  belongs_to :contact_group_type

  validates :contact_group_type, presence: true
  validates :title, presence: true

  def to_s
    title
  end
end
