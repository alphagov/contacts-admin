module Contacts
  class Publisher
    def self.publish(base_path, presenter)
      presented = presenter.present
      Contacts.publishing_api.put_content_item(base_path, presented)
    end
  end
end
