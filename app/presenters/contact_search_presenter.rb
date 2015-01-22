class ContactSearchPresenter
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
      organisation: contact.organisation.as_json
    }
  end
end
