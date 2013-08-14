class Contact < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :cluster_group

  serialize :keywords, Array

  has_many :websites, inverse_of: :contact, dependent: :destroy
  has_many :numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy
end
