class ContactGroup < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Versioning
  include FriendlyId
  include BelongsToDepartment

  friendly_id :title, use: :history

  has_many :contacts, through: :contact_memberships
  has_many :contact_memberships, dependent: :destroy

  belongs_to_active_hash :contact_group_type

  validates :title, presence: true
  validates :description, presence: true

  scope :most_popular, -> {
    where(contact_group_type_id: ContactGroupType.most_popular.id)
  }
  scope :except_most_popular, -> {
    where("contact_group_type_id != ?", ContactGroupType.most_popular.id)
  }
  scope :with_contacts, -> { includes(:contacts) }
  scope :by_title, -> { order("contact_groups.title ASC") }

  def to_s
    title
  end
end
