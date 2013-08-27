class Office < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :department

  belongs_to :contact, inverse_of: :offices

  validates :title, presence: true
  validates :contact, presence: true
  validates :department, presence: true

  def to_s
    title
  end
end
