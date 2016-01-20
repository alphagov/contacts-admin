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
      format: "contact",
      locale: "en",
      publishing_app: "contacts",
      rendering_app: "contacts-frontend",
      update_type: "major",
      base_path: contact.link,
      public_updated_at: contact.updated_at,
      routes: [
        { path: contact.link, type: "exact" }
      ],
      details: contact_details.merge(language: "en"),
      need_ids: [],
    }
  end

  def links
    {
      links: {
        "related" => @contact.related_contacts.pluck(:content_id),
        "organisations" => Array(@contact.organisation.content_id)
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
      organisation: ContactOrganisationPresenter.new(contact.organisation).present,
      quick_links: contact.quick_links.map {|q| {title: q.title, url: q.url} },
      query_response_time: (contact.query_response_time || false),

      contact_groups: ContactGroupsPresenter.new(contact.contact_groups).present,

      contact_form_links: ContactFormLinksPresenter.new(contact.contact_form_links).present,
      more_info_contact_form: govspeak(contact.more_info_contact_form),

      email_addresses: EmailAddressesPresenter.new(contact.email_addresses).present,
      more_info_email_address: govspeak(contact.more_info_email_address),

      phone_numbers: PhoneNumbersPresenter.new(contact.phone_numbers).present,
      more_info_phone_number: govspeak(contact.more_info_phone_number),

      post_addresses: PostAddressesPresenter.new(contact.post_addresses).present,
      more_info_post_address: govspeak(contact.more_info_post_address),
    }
  end
end
