require "singleton"

class SeedDatabase
  include Singleton

  def run
    create_users
    hmrc_organisation = create_hmrc_organisation
    create_contact_groups(hmrc_organisation)
  end

  def create_users
    User.create(
      name: "Winston",
      uid: "winston",
      version: 1,
      email: "winston@alphagov.co.uk",
      permissions: %w[signin],
    )
  end

  def create_hmrc_organisation
    # These values should match what Whitehall has stored so that
    # the publishing end-to-end tests can succeed
    Organisation.create(
      title: "HM Revenue & Customs",
      slug: "hm-revenue-customs",
      abbreviation: "HMRC",
      content_id: "6667cce2-e809-4e21-ae09-cb0bdc1ddda3",
    )
  end

  CONTACT_GROUPS = [
    {
      contact_group_type: ContactGroupType.most_popular,
      title: "Change of details",
      description: "Contact HMRC about a change in your details",
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: "Tax",
      description: "General Tax enquiries for individuals, employees and self-employed",
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: "Tax credits and other benefits",
      description: "Tax credits enquiries",
    },
    {
      contact_group_type: ContactGroupType.most_popular,
      title: "VAT, Customs, Excise duties",
      description: "Customs, International Trade & Excise enquiries",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "National Insurance",
      description: "National Insurance enquiries for employees and individuals",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Employers",
      description: "HMRC contacts for Employers",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Income Tax",
      description: "Income Tax enquiries for individuals, pensioners and employees",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Self Assessment",
      description: "Help and advice for customers completing their tax return and supplementary pages, or who need general advice about Self Assessment",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Child Benefit",
      description: "Child Benefit helpline",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Corporation Tax",
      description: "Help with Corporation Tax",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Construction Industry Scheme (CIS)",
      description: "Help and advice for subcontractors and contractors within the Construction Industry Scheme",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Self Employed",
      description: "HMRC contacts for self-employed",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Charities & clubs",
      description: "Information for charities and CASCs about Gift Aid, Payroll Giving, tax reliefs, VAT, how to complete a Company or Self Assessment tax return, and forms that can be downloaded",
    },
    {
      contact_group_type: ContactGroupType.for_individuals,
      title: "Bereavement",
      description: "What to do about Tax after a death",
    },
  ].freeze

  def create_contact_groups(hmrc_organisation)
    CONTACT_GROUPS.each do |contact_group|
      ContactGroup.find_or_create_by(
        contact_group_type_id: contact_group[:contact_group_type].id,
        title: contact_group[:title],
        description: contact_group[:description],
        organisation_id: hmrc_organisation.id,
      )
    end
  end
end
