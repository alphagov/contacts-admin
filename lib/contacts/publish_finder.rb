module Contacts
  class PublishFinder
    def self.publish(presenter)
      presented = presenter.present
      Contacts.publishing_api.put_content_item(presented[:base_path], presented)
    end
  end
end
