class ContactGroup < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :contacts
  has_many :offices, through: :contacts
  belongs_to :contact_group_type

  validates :title, presence: true
  validates :description, presence: true

  scope :most_popular, -> {
    where(contact_group_type_id: ContactGroupType.most_popular.id)
  }
  scope :with_contacts, -> { includes(:contacts) }
  scope :with_offices, -> { with_contacts.includes(:offices) }

  def to_s
    title
  end
end
