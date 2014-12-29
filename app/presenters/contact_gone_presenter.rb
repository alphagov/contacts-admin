class ContactGonePresenter
  include GovspeakHelper

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def present
    {
      base_path: contact.link,
      format: "gone",
      publishing_app: "contacts",
      update_type: "major",
      routes: [
        { path: contact.link, type: "exact" }
      ],
    }
  end
end
