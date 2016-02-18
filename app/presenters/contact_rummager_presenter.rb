class ContactRummagerPresenter
  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def present
    {
      title: contact.title,
      description: contact.description,
      link: contact.link,
      format: "contact",
      indexable_content: "#{contact.title} #{contact.description} #{contact.contact_groups.map(&:title).join}",
      organisations: [contact.organisation.slug],
      public_timestamp: contact.updated_at.iso8601,
    }
  end
end
