class Department < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :contacts

  def self.hmrc
    find(1)
  end

  def to_s
    title
  end
end
