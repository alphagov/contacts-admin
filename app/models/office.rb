class Office < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :department

  acts_as_url :title, url_attribute: :slug, sync_url: true

  has_many :questions, inverse_of: :office
  belongs_to :contact, inverse_of: :offices

  validates :title, presence: true
  validates :contact, presence: true
  validates :department, presence: true

  def to_s
    title
  end
end
