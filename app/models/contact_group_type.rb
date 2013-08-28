class ContactGroupType < ActiveYaml::Base
  include ActiveHash::Associations

  field :title

  has_many :contact_groups

  def self.most_popular
    find(1)
  end

  def self.for_individuals
    find(2)
  end
end
