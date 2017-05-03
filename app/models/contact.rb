require 'publisher'

class Contact < ApplicationRecord
  include Versioning
  include FriendlyId

  before_validation :set_content_id, on: :create
  attr_readonly :content_id

  after_save :register_contact

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

  validate :organisation_should_never_change

  scope :by_title, -> { order("title ASC") }
  scope :ungrouped, -> { where(contact_group_id: nil) }
  scope :for_listing, -> {
    where(
      "`contacts`.`phone_numbers_count` > 0 OR `contacts`.`post_addresses_count` > 0 OR `contacts`.`email_addresses_count` > 0 OR `contacts`.`contact_form_links_count` > 0"
    ).order("contacts.popularity DESC, contacts.title")
  }

  def quick_links
    links = [
      { title: quick_link_title_1, url: quick_link_1 },
      { title: quick_link_title_2, url: quick_link_2 },
      { title: quick_link_title_3, url: quick_link_3 },
    ]
    links.reject { |link| link[:title].blank? || link[:url].blank? }
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

  def register_contact
    rummager_id = link.gsub(%r{^/}, '')
    rummager_presenter = ContactRummagerPresenter.new(self)
    Services.rummager_client.add_document("contact", rummager_id, rummager_presenter.present)

    presenter = ContactPresenter.new(self)
    Publisher.publish(presenter)
  end

  def organisation_should_never_change
    if persisted? && organisation_id_changed?
      errors[:organisation] << "can't be changed"
    end
  end
end
