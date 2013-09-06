class Contact < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  acts_as_url :title, url_attribute: :slug, sync_url: true

  belongs_to_active_hash :department
  belongs_to :contact_group, counter_cache: true

  has_many :questions, inverse_of: :contact

  has_many :related_content_links, inverse_of: :contact, dependent: :destroy
  has_many :contact_form_links, inverse_of: :contact

  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  serialize :keywords, Array

  def to_s
    title
  end
end
