class ContactGroup < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  acts_as_url :title, url_attribute: :slug, sync_url: true

  has_many :contacts
  has_many :questions, through: :contacts

  belongs_to_active_hash :contact_group_type
  belongs_to :department

  validates :title, presence: true
  validates :description, presence: true

  scope :most_popular, -> {
    where(contact_group_type_id: ContactGroupType.most_popular.id)
  }
  scope :except_most_popular, -> {
    where("contact_group_type_id != ?", ContactGroupType.most_popular.id)
  }
  scope :with_contacts, -> { includes(:contacts) }
  scope :by_title, -> { order("title ASC") }

  def to_s
    title
  end
end
