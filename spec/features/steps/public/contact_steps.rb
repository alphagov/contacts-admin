module Public
  module ContactSteps
    include ::CommonSteps

    def should_list_contact(contact)
      expect(page).to have_link(contact.title, href: "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    end

    def should_not_list_contact(contact)
      expect(page).to_not have_link(contact.title, href: "/government/organisations/#{hmrc.slug}/contact/#{contact.slug}")
    end

    def should_have_page_heading(text)
      within("header h1") do
        expect(page).to have_content(text)
      end
    end

    def should_have_title(text)
      expect(page).to have_title(text)
    end

    def search_for(text)
      fill_in("Contains", with: text)
    end

    def select_topic(topic_title)
      select(topic_title, from: "Topic")
    end

    def refresh_results
      click_on("Refresh results")
    end
  end
end
