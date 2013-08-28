class ContactType < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :offices

  def to_s
    title
  end
end
