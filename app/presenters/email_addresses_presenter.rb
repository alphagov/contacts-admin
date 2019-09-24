class EmailAddressesPresenter
  include GovspeakHelper

  def initialize(email_addresses)
    @email_addresses = email_addresses
  end

  def present
    @email_addresses.map do |e|
      {
        title: e.title,
        email: e.email,
        description: govspeak(e.description),
      }
    end
  end
end
