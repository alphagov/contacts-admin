module Public
  module ContactSteps
    include ::CommonSteps

    def contacts_exist(contacts)
      has_selector?(contacts_page_selector) &&
        within(contacts_list_selector) do
          contacts.each do |contact|
            has_content? contact.title
          end
        end
    end

    def contacts_page_selector
      "div.contacts-page"
    end

    def contacts_list_selector
      "ol.document-list"
    end
  end
end