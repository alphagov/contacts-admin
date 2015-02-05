class ContactsFinderPresenter

  def initialize(organisation)
    @organisation = organisation
  end

  def present
    {
      base_path: base_path,
      format: "finder",
      content_id: content_id,
      title: title,
      description: description,
      public_updated_at: public_updated_at,
      update_type: "minor",
      publishing_app: "contacts-admin",
      rendering_app: "finder-frontend",
      routes: routes,
      details: details,
      links: {
        organisations: organisations,
        topics: [],
        related: [],
      },
    }
  end

private
  attr_reader :organisation

  def title
    "#{organisation.title} Contacts"
  end

  def content_id
    organisation.contact_index_content_id
  end

  def base_path
    "/government/organisations/#{organisation.slug}/contact"
  end

  def description
    ""
  end

  def details
    {
      document_noun: "contact",
      document_type: "contact",
      facets: facets,
    }
  end

  def facets
    [
      {
        key: "contact_group",
        name: "Topic",
        filterable: true,
        type: "text",
        display_in_result_metadata: true,
        preposition: "in topic",
        allowed_values: contact_groups_to_facet,
      }
    ]
  end

  def contact_groups_to_facet
    organisation.contact_groups.map { |g|
      {
        label: g.title,
        value: g.title.downcase.gsub(' ', '-'),
      }
    }
  end

  def routes
    [
      {
        path: base_path,
        type: "exact",
      },
      {
        path: "#{base_path}.json",
        type: "exact",
      }
    ]
  end

  def need_ids
    []
  end

  def organisations
    []
  end

  def public_updated_at
    organisation.contact_groups.map(&:updated_at).max
  end
end
