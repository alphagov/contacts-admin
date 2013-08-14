class ClusterGroup < ActiveYaml::Base
  include ActiveHash::Associations

  has_many :contacts
end
