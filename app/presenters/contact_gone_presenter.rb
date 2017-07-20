require 'securerandom'

class ContactGonePresenter
  include GovspeakHelper

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def present
    {
      document_type: "gone",
      schema_name: "gone",
      publishing_app: "contacts",
      base_path: contact.link,
      routes: [
        { path: contact.link, type: "exact" }
      ],
      update_type: "major",
    }
  end

  def content_id
    @_content_id ||= SecureRandom.uuid
  end

  def links
    nil
  end

  alias_method :payload, :present
end
