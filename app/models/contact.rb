class Contact < ActiveRecord::Base
  include Versioning

  acts_as_url :title, url_attribute: :slug, sync_url: true

  belongs_to :department
  belongs_to :contact_group, counter_cache: true

  has_many :questions, inverse_of: :contact

  has_many :related_content_links, inverse_of: :contact, dependent: :destroy
  has_many :contact_form_links, inverse_of: :contact

  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :by_title, -> { order("title ASC") }
  scope :ungrouped, -> {
    where(contact_group_id: nil)
  }
  scope :for_listing, -> {
    where(
      "`contacts`.`phone_numbers_count` > 0 OR `contacts`.`post_addresses_count` > 0 OR `contacts`.`email_addresses_count` > 0 OR `contacts`.`contact_form_links_count` > 0"
    ).order("contacts.title ASC")
  }

  def to_s
    title
  end

  def link
    "/#{APP_SLUG}/#{department.slug}/#{self.slug}"
  end

  def to_indexed_json
    {
      title: title,
      description: description,
      link: link,
      format: "contact",
      indexable_content: "#{title} #{description} #{questions.map(&:title).join}"
    }
  end
end
