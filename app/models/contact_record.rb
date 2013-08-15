class ContactRecord < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :contact_type

  has_many :contacts, dependent: :destroy
  has_many :websites, inverse_of: :contact_record, dependent: :destroy
  has_many :numbers, inverse_of: :contact_record, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact_record, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact_record, dependent: :destroy

  serialize :keywords, Array
end
