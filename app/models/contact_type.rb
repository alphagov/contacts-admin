class ContactType < ActiveYaml::Base
  include ActiveHash::Associations

  has_many :contacts
end
