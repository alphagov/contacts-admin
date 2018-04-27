class ContactPresenter
  include GovspeakHelper

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def content_id
    contact.content_id
  end

  def present
    {
      title: contact.title,
      description: contact.description,
      document_type: "contact",
      schema_name: "contact",
      locale: "en",
      publishing_app: "contacts",
      rendering_app: "government-frontend",
      base_path: contact.link,
      public_updated_at: contact.updated_at,
      routes: [
        { path: contact.link, type: "exact" }
      ],
      details: contact_details.merge(language: "en"),
      update_type: "major",
    }
  end

  def links
    # The Contact model uses the organisation to determine its base path, for this reason,
    # we decided not to send the organisation data to publishing-api here but only on creation.
    # - Users can only select the organisation for the contact on creation
    # - After creation, we send the organisation to the publishing-api once
    # This means that if the `organisations` in the links is modified, contacts-admin will not
    # accidentally overwrite it - and we can start tagging contact pages with content-tagger.
    # See: https://github.com/alphagov/contacts-admin/pull/231.
    {
      links: {
        "related" => @contact.related_contacts.pluck(:content_id),
        "parent"  => [PublishFinders::HMRC_CONTACTS_CONTENT_ID]
      }
    }
  end

  alias_method :payload, :present

private

  def contact_details
    {
      slug: contact.slug,
      title: contact.title,
      description: contact.description,
      quick_links: contact.quick_links.map { |q| { title: q[:title], url: q[:url] } },
      query_response_time: (contact.query_response_time || false),

      contact_form_links: ContactFormLinksPresenter.new(contact.contact_form_links).present,
      more_info_contact_form: govspeak(contact.more_info_contact_form),

      email_addresses: EmailAddressesPresenter.new(contact.email_addresses).present,
      more_info_email_address: govspeak(contact.more_info_email_address),

      phone_numbers: PhoneNumbersPresenter.new(contact.phone_numbers).present,
      more_info_phone_number: govspeak(contact.more_info_phone_number),

      post_addresses: PostAddressesPresenter.new(contact.post_addresses).present,
      more_info_post_address: govspeak(contact.more_info_post_address),
      contact_groups: contact.contact_groups.map { |group| { title: group.title, slug: group.slug } }
    }
  end
end
