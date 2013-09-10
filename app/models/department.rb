class Department < ActiveRecord::Base

  acts_as_url :title, url_attribute: :slug, sync_url: true

  has_many :contacts
  has_many :contact_groups

  def self.hmrc
    find_by(slug: 'hmrc')
  end

  def to_s
    title
  end

  def to_param
    slug
  end
end
