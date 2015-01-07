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
      expect(page).to have_link(contact.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    end

    def should_not_list_contact(contact)
      expect(page).to_not have_link(contact.title, :href => "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    end

    def should_have_page_heading(text)
      within('header h1') do
        expect(page).to have_content(text)
      end
    end

    def should_have_title(text)
      expect(page).to have_title(text)
    end

    def contacts_page_selector
      "div.contacts-page"
    end

    def contacts_list_selector
      "ol.document-list"
    end
  end
end