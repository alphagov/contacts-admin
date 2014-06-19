class ContactGroupsPresenter
  def initialize(contact_groups)
    @contact_groups = contact_groups
  end

  def present
    @contact_groups.map do |group|
      {
        title: group.title,
        organisation: group.organisation.as_json,
        description: govspeak(group.description),
        contacts: group.contacts.map do |contact|
          { description: govspeak(contact.description) }
        end
      }
    end
  end

  private

  def govspeak(text)
    if text
      Govspeak::Document.new(text).to_sanitized_html
    end
  end
end
