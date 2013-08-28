require 'singleton'

class SeedDatabase
  include Singleton

  def run
    create_users
    create_contact_groups
  end

  def create_users
    User.new { |u|
      u.name = 'Winston'
      u.uid = 'winston'
      u.version = 1
      u.email = 'winston@alphagov.co.uk'
      u.permissions = ['signin']
    }.save
  end

  CONTACT_GROUPS = [
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'Change of details',
      description:'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'Tax',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'Tax credits and other benefits',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'VAT, Customs, Excise duties',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'National Insurance',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Employers',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Income Tax',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Self Assessment',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Child Benefit',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Corporation Tax',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Construction Industry Scheme (CIS)',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Self Employed',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Charities & clubs',
      description: 'Get an estimate of how much tax you may need'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Bereavement',
      description: 'Get an estimate of how much tax you may need'
    }
  ]


  def create_contact_groups
    CONTACT_GROUPS.each do |contact_group|
      ContactGroup.find_or_create_by(
        contact_group_type_id: contact_group[:contact_group_type].id,
        title: contact_group[:title],
        description: contact_group[:description]
      )
    end
  end
end
