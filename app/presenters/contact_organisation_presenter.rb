class ContactOrganisationPresenter
  attr_reader :organisation

  def initialize(organisation)
    @organisation = organisation
  end

  def present
    {
      id: organisation.id,
      title: organisation.title,
      format: organisation.format,
      slug: organisation.slug,
      abbreviation: organisation.abbreviation,
      govuk_status: organisation.govuk_status,
      created_at: organisation.created_at,
      updated_at: organisation.updated_at,
      ancestry: organisation.ancestry,
      contact_index_content_id: organisation.contact_index_content_id
     }
  end
end
