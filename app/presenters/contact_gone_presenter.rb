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
      base_path: contact.link,
      routes: [
        { path: contact.link, type: "exact" }
      ],
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
