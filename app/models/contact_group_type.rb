class ContactGroupType < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :contact_groups
end
