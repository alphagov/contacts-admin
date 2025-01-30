# This service currently only publishes the HMRC contacts finder since this app
# only contains contacts related to HMRC.
class PublishFinders
  HMRC_CONTACTS_CONTENT_ID = "b110c03c-3f8d-4327-906b-17ebd872e6a6".freeze
  HMRC_ORGANISATION_CONTENT_ID = "6667cce2-e809-4e21-ae09-cb0bdc1ddda3".freeze

  def self.call
    new.call
  end

  def call
    Services.publishing_api.put_content(
      HMRC_CONTACTS_CONTENT_ID,
      hmrc_contacts_payload,
    )
    Services.publishing_api.publish(HMRC_CONTACTS_CONTENT_ID)
    Services.publishing_api.patch_links(
      HMRC_CONTACTS_CONTENT_ID,
      links: hmrc_contacts_parent,
    )
  end

private

  def hmrc_contacts_payload
    {
      "base_path": "/government/organisations/hm-revenue-customs/contact",
      "title": "Contact HM Revenue & Customs",
      "description": "",
      "locale": "en",
      "document_type": "finder",
      "schema_name": "finder",
      "publishing_app": "contacts",
      "rendering_app": "finder-frontend",
      "update_type": "major",
      "details": {
        "document_noun": "contact",
        "default_order": "title",
        "facets": [
          {
            "key": "contact_groups",
            "name": "Topics",
            "type": "text",
            "preposition": "in topic",
            "display_as_result_metadata": false,
            "filterable": true,
            "allowed_values": contact_groups_hash,
          },
        ],
        "filter": {
          "format": "contact",
          "organisations": %w[hm-revenue-customs],
        },
        "show_summaries": true,
      },
      "routes": [
        {
          "type": "exact",
          "path": "/government/organisations/hm-revenue-customs/contact",
        },
        {
          "type": "exact",
          "path": "/government/organisations/hm-revenue-customs/contact.json",
        },
      ],
    }
  end

  def hmrc_contacts_parent
    # Sets the parent of the HMRC contacts finder to the HMRC organisation page
    {
      parent: %w[
        6667cce2-e809-4e21-ae09-cb0bdc1ddda3
      ],
    }
  end

  def contact_groups_hash
    contact_groups = ContactGroup.order("title ASC").all
    contact_groups.map do |contact_group|
      {
        label: contact_group.title,
        value: contact_group.slug,
      }
    end
  end
end
