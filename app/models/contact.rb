require 'publisher'

class Contact < ActiveRecord::Base
  include Versioning
  include FriendlyId

  before_validation :set_content_id, on: :create
  attr_readonly :content_id

  friendly_id :title, use: :history

  belongs_to :organisation

  has_many :contact_groups, through: :contact_memberships
  has_many :contact_memberships, dependent: :destroy

  has_many :contact_form_links, inverse_of: :contact, dependent: :destroy
  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy

  has_many :contact_relationships
  has_many :related_contacts, through: :contact_relationships

  validates :title, presence: true
  validates :description, presence: true
  validates :content_id, uuid: true

  scope :by_title, -> { order("title ASC") }
  scope :ungrouped, -> { where(contact_group_id: nil) }
  scope :for_listing, -> {
    where(
      "`contacts`.`phone_numbers_count` > 0 OR `contacts`.`post_addresses_count` > 0 OR `contacts`.`email_addresses_count` > 0 OR `contacts`.`contact_form_links_count` > 0"
    ).order("contacts.popularity DESC, contacts.title")
  }

  def quick_links
    links = [
      OpenStruct.new(title: quick_link_title_1, url: quick_link_1),
      OpenStruct.new(title: quick_link_title_2, url: quick_link_2),
      OpenStruct.new(title: quick_link_title_3, url: quick_link_3),
    ]
    links.reject { |link| link.title.blank? || link.url.blank? }
  end

  def to_s
    title
  end

  def link
    "/government/organisations/#{organisation.slug}/contact/#{slug}"
  end

  def republish
    register_contact
  end

private

  def set_content_id
    self.content_id ||= SecureRandom.uuid
  end
end
