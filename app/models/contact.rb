class Contact < ActiveRecord::Base
  include Versioning
  include FriendlyId
  include BelongsToDepartment

  friendly_id :title, use: :history

  has_many :contact_groups, through: :contact_memberships
  has_many :contact_memberships, dependent: :destroy

  has_many :questions, inverse_of: :contact

  has_many :related_content_links, inverse_of: :contact, dependent: :destroy
  has_many :contact_form_links, inverse_of: :contact

  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :by_title, -> { order("title ASC") }
  scope :ungrouped, -> { where(contact_group_id: nil) }
  scope :with_needs, -> { where.not(need_id: nil) }
  scope :for_listing, -> {
    where(
      "`contacts`.`phone_numbers_count` > 0 OR `contacts`.`post_addresses_count` > 0 OR `contacts`.`email_addresses_count` > 0 OR `contacts`.`contact_form_links_count` > 0"
    ).order("contacts.title ASC")
  }

  def self.index_for_search
    Contact.includes(:contact_groups).with_needs.map(&:to_indexed_json)
  end

  def to_s
    title
  end

  def link
    "/#{APP_SLUG}/#{department.slug}/#{slug}"
  end

  def to_indexed_json
    {
      title: title,
      description: description,
      link: link,
      format: "contact",
      indexable_content: "#{title} #{description} #{contact_groups.map(&:title).join}",
      department: department.as_json
    }
  end
end
