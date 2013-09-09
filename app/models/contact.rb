class Contact < ActiveRecord::Base
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
      arel_table[:phone_numbers_count].gt(0).or(
        arel_table[:post_addresses_count].gt(0)
      ).or(
        arel_table[:email_addresses_count].gt(0)
      ).or(
        arel_table[:contact_form_links_count].gt(0)
      )
    ).order("title ASC")
  }

  def to_s
    title
  end

  def to_indexed_json
    {
      title: title,
      description: description,
      link: "/#{APP_SLUG}/#{department.slug}/#{self.slug}",
      format: "contact",
      indexable_content: "#{title} #{description} #{questions.map(&:title).join}"
    }
  end
end
