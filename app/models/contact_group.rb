class ContactGroup < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Versioning
  include BelongsToDepartment

  acts_as_url :title, url_attribute: :slug, sync_url: true

  has_many :contacts, through: :contact_memberships
  has_many :contact_memberships, dependent: :destroy
  has_many :questions

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
