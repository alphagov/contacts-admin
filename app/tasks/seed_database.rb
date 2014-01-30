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
      description: 'Contact HMRC about a change in your details'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'Tax',
      description: 'General Tax enquiries for individuals, employees and self-employed'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'Tax credits and other benefits',
      description: 'Tax credits enquiries'
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: 'VAT, Customs, Excise duties',
      description: 'Customs, International Trade & Excise enquiries'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'National Insurance',
      description: 'National Insurance enquiries for employees and individuals'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Employers',
      description: 'HMRC contacts for Employers'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Income Tax',
      description: 'Income Tax enquiries for individuals, pensioners and employees'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Self Assessment',
      description: 'Help and advice for customers completing their tax return and supplementary pages, or who need general advice about Self Assessment'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Child Benefit',
      description: 'Child Benefit helpline'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Corporation Tax',
      description: 'Help with Corporation Tax'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Construction Industry Scheme (CIS)',
      description: 'Help and advice for subcontractors and contractors within the Construction Industry Scheme'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Self Employed',
      description: 'HMRC contacts for self-employed'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Charities & clubs',
      description: 'Information for charities and CASCs about Gift Aid, Payroll Giving, tax reliefs, VAT, how to complete a Company or Self Assessment tax return, and forms that can be downloaded'
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: 'Bereavement',
      description: 'What to do about Tax after a death'
    }
  ]


  def create_contact_groups
    CONTACT_GROUPS.each do |contact_group|
      ContactGroup.find_or_create_by(
        contact_group_type_id: contact_group[:contact_group_type].id,
        title: contact_group[:title],
        description: contact_group[:description],
        department_id: Department.first.id
      )
    end
  end
end
