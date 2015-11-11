require 'securerandom'

class ContactGonePresenter
  include GovspeakHelper

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def present
    {
      format: "gone",
      publishing_app: "contacts",
      update_type: "major",
      routes: [
        { path: contact.link, type: "exact" }
      ],
      content_id: content_id,
    }
  end

private
  def content_id
    @_content_id ||= SecureRandom.uuid
  end
end
