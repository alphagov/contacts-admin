# Temporary class to migrate an individual contact from its Contacts Admin
# page to its HMRC Specialist Finder equivalent

module MigrateContactError
  class ContactNotFound < StandardError; end
end

class ContactMigrator
  def migrate_contact(original_url: nil, new_url: nil)
    contact = contact_by_url(original_url)

    Services.publishing_api.unpublish(
      contact.content_id,
      type: "redirect",
      explanation: "Migrated to HMRC Specialist Finder",
      alternative_path: new_url,
      discard_drafts: true,
    )
  end

private

  def contact_by_url(url)
    slug = url.split("/").last
    Contact.find_by!(slug:)
  rescue ActiveRecord::RecordNotFound
    raise MigrateContactError::ContactNotFound, "No corresponding Contact found for #{url}"
  end
end
