class ContactRecord < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :contacts
  belongs_to_active_hash :contact_type

  serialize :keywords, Array

  has_many :websites, inverse_of: :contact, dependent: :destroy
  has_many :numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy
end
