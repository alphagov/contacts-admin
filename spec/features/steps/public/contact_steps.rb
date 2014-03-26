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

    def should_list_contact(contact)
      expect(page).to have_content(contact.title)
    end

    def should_not_list_contact(contact)
      expect(page).to_not have_content(contact.title)
    end

    def contacts_page_selector
      "div.contacts-page"
    end

    def contacts_list_selector
      "ol.document-list"
    end
  end
end