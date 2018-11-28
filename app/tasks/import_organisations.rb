require 'gds_api/organisations'

class ImportOrganisations
  def call
    organisation_relationships = {}
    organisations.each do |organisation_data|
      update_or_create_organisation(organisation_data)
      organisation_relationships[organisation_data["details"]["slug"]] = child_organisation_slugs(organisation_data)
    end
    update_ancestry(organisation_relationships)
  rescue ActiveRecord::RecordInvalid => invalid
    raise "Couldn't save organisation #{invalid.record.slug} because: #{invalid.record.errors.full_messages.join(',')}"
  end

private

  def organisations
    base_uri = Plek.new.website_root
    GdsApi::Organisations.new(base_uri).organisations.with_subsequent_pages
  end

  def update_or_create_organisation(organisation_data)
    organisation = Organisation.find_or_create_by(slug: organisation_data["details"]["slug"])
    update_data = {
      title: organisation_data["title"],
      format: organisation_data["format"],
      abbreviation: organisation_data["details"]["abbreviation"],
      govuk_status: organisation_data["details"]["govuk_status"],
      content_id: organisation_data["details"]["content_id"]
    }
    organisation.update_attributes!(update_data)
  end

  def child_organisation_slugs(organisation_data)
    organisation_data["child_organisations"].map { |child| child["id"] }
      .collect { |child_organisation_id| child_organisation_id.split('/').last }
  end

  def update_ancestry(organisation_relationships)
    organisation_relationships.each do |organisation_slug, child_organisation_slugs|
      Organisation.where(slug: child_organisation_slugs).map do |child_organisation|
        child_organisation.update_attributes!(parent: Organisation.find_by_slug(organisation_slug))
      end
    end
  end
end
