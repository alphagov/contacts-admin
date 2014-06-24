module Contacts
  class RegisterContact
    def self.register(presenter)
      presented = presenter.present
      Contacts.content_store_api.put_content_item(presented[:base_path], presented)
    end
  end
end
