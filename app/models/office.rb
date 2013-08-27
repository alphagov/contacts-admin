class Office < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :department

  belongs_to :contact_record, inverse_of: :offices

  validates :title, presence: true
  validates :contact_record, presence: true
  validates :department, presence: true

  def to_s
    title
  end
end
