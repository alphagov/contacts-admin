# This service currently only publishes the HMRC contacts finder since this app
# only contains contacts related to HMRC.
class PublishFinders
  def self.call
    new.call
  end

  def call
    Services.publishing_api.put_content(
      HMRC_CONTACTS_CONTENT_ID,
      hmrc_contacts_payload
    )
    Services.publishing_api.publish(HMRC_CONTACTS_CONTENT_ID, "major")
    Services.publishing_api.patch_links(
      HMRC_CONTACTS_CONTENT_ID,
      links: hmrc_contacts_parent
    )
  end

private

  HMRC_CONTACTS_CONTENT_ID = "b110c03c-3f8d-4327-906b-17ebd872e6a6".freeze

  def hmrc_contacts_payload
    {
      "base_path": "/government/organisations/hm-revenue-customs/contact",
      "title": "HM Revenue & Customs Contacts",
      "description": "",
      "locale": "en",
      "document_type": "finder",
      "schema_name": "finder",
      "publishing_app": "contacts",
      "rendering_app": "finder-frontend",
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
            "allowed_values": contact_groups_hash
          }
        ],
        "filter": {
          "format": "contact"
        },
        "format_name": "HM Revenue & Customs Contacts",
        "show_summaries": true
      },
      "routes": [
        {
          "type": "exact",
          "path": "/government/organisations/hm-revenue-customs/contact"
        },
        {
          "type": "exact",
          "path": "/government/organisations/hm-revenue-customs/contact.json"
        }
      ]
    }
  end

  def hmrc_contacts_parent
    # Sets the parent of the HMRC contacts finder to the HMRC organisation page
    {
      parent: [
        "6667cce2-e809-4e21-ae09-cb0bdc1ddda3"
      ]
    }
  end

  def contact_groups_hash
    contact_groups = ContactGroup.order("title ASC").all
    contact_groups.map do |contact_group|
      {
        label: contact_group.title,
        value: contact_group.slug
      }
    end
  end
end
