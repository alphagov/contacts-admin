class ContactRecord < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :contact_type

  has_many :contacts, dependent: :destroy, inverse_of: :contact_record

  has_many :related_content_links, inverse_of: :contact_record, dependent: :destroy
  has_many :contact_form_links, inverse_of: :contact_record

  has_many :numbers, inverse_of: :contact_record, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact_record, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact_record, dependent: :destroy

  has_one  :more_info_website, inverse_of: :contact_record
  has_one  :more_info_email_address, inverse_of: :contact_record
  has_one  :more_info_post_address, inverse_of: :contact_record
  has_one  :more_info_number, inverse_of: :contact_record

  serialize :keywords, Array

  scope :with_more_info_records, -> {
    includes(:more_info_website, :more_info_email_address, :more_info_post_address, :more_info_number)
  }

  def to_s
    description
  end
end
