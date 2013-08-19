class ContactType < ActiveYaml::Base
  include ActiveHash::Associations

  has_many :contacts

  def to_s
    title
  end
end
