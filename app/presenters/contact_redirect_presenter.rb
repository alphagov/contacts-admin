require 'securerandom'

class ContactRedirectPresenter
  attr_reader :contact, :redirect_to_location

  def initialize(contact, redirect_to_location)
    @contact = contact
    @redirect_to_location = redirect_to_location
  end

  def present
    {
      format: "redirect",
      publishing_app: "contacts",
      update_type: "major",
      base_path: contact.link,
      redirects: [
        {
          path: contact.link,
          type: "exact",
          destination: redirect_to_location
        }
      ],
      content_id: content_id,
    }
  end

private
  def content_id
    @_content_id ||= SecureRandom.uuid
  end
end
