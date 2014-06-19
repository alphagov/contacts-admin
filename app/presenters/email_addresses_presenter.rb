class EmailAddressesPresenter
  def initialize(email_addresses)
    @email_addresses = email_addresses
  end

  def present
    @email_addresses.map do |e|
      {
        title: e.title,
        email: e.email,
        description: govspeak(e.description)
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
