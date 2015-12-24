class ChangeContactsToUseOrganisations < ActiveRecord::Migration
  def up
    Organisation.new(
      slug: "hm-revenue-customs",
      title: "HM Revenue & Customs",
      format: "Non-ministerial department",
      abbreviation: "HMRC",
      govuk_status: "live"
    ).save!(validate: false)

    add_column :contacts, :organisation_id, :integer
    add_column :contact_groups, :organisation_id, :integer

    Contact.joins('JOIN organisations ON department_id = organisations.slug').update_all('organisation_id = organisations.id')
    ContactGroup.joins('JOIN organisations ON department_id = organisations.slug').update_all('organisation_id = organisations.id')

    remove_column :contacts, :department_id
    remove_column :contact_groups, :department_id
  end

  def down
    add_column :contacts, :department_id, :string
    add_column :contact_groups, :department_id, :string

    Contact.joins('JOIN organisations ON organisation_id = organisations.id').update_all('department_id = organisations.slug')
    ContactGroup.joins('JOIN organisations ON organisation_id = organisations.id').update_all('department_id = organisations.slug')

    remove_column :contacts, :organisation_id
    remove_column :contact_groups, :organisation_id
  end

end
