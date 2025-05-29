# Temporary class to migrate an individual contact from its Contacts Admin
# page to its HMRC Specialist Finder equivalent

module MigrateContactError
  class ContactNotFound < StandardError; end
  class PublishingApiRequestFailed < StandardError; end
  class RedirectUrlMissing < StandardError; end
end

class ContactMigrator
  def migrate_hmrc_contacts
    contacts = YAML.load_file(Rails.root.join("config/hmrc_contacts_to_redirect.yml"))["contacts"]

    ActiveRecord::Base.transaction do
      contacts.each do |contact|
        migrate_contact(
          original_url: contact["original_url"],
          new_url: contact["new_url"],
        )
      end
    end
  end

  def migrate_contact(original_url: nil, new_url: nil)
    validate_redirect_url!(original_url, new_url)
    contact = contact_by_url(original_url)

    Services.publishing_api.unpublish(
      contact.content_id,
      type: "redirect",
      explanation: "Migrated to HMRC Specialist Finder",
      alternative_path: new_url,
      discard_drafts: true,
    )

    contact.destroy!
  rescue GdsApi::HTTPErrorResponse => e
    raise MigrateContactError::PublishingApiRequestFailed, "#{e.class} error (#{e.code}): #{e.message}"
  end

private

  def validate_redirect_url!(original_url, new_url)
    raise MigrateContactError::RedirectUrlMissing, "Missing a redirect URL (`new_url`) for #{original_url}" unless new_url
  end

  def contact_by_url(url)
    slug = url.split("/").last
    Contact.find_by!(slug:)
  rescue ActiveRecord::RecordNotFound
    raise MigrateContactError::ContactNotFound, "No corresponding Contact found for #{url}"
  end
end
