class Department < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :contacts
  has_many :contact_groups

  def self.hmrc
    find_by_id(1)
  end

  def to_s
    title
  end
end
