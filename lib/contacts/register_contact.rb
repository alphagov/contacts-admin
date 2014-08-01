module Contacts
  class RegisterContact
    def self.register(presenter)
      presented = presenter.present
      Contacts.publishing_api.put_content_item(presented[:base_path], presented)
    end
  end
end
