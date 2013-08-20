class ContactType < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :contacts

  def to_s
    title
  end
end
