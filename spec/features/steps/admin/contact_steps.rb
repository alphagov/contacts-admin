module Admin
  module ContactSteps
    include ::CommonSteps

    def should_list_contact(contact_title)
      expect(page).to have_content(contact_title)
    end

    def should_not_list_contact(contact_title)
      expect(page).to_not have_content(contact_title)
    end

    def filter_by_organisation(organisation_name)
      select organisation_name, from: 'search_organisation_id'
    end

    def filter_by_title_or_description(title_or_description)
      fill_in 'search_q', with: title_or_description
    end

    def submit_filter_form
      click_button "Filter contacts"
    end

    def contact_exists(contact)
      ensure_on admin_contacts_path

      has_selector?(contacts_table_selector) &&
        within(contacts_table_selector) do
          has_content? contact.description
        end
    end

    def delete_contact(contact)
      ensure_on edit_admin_contact_path(contact)
      click_link "Delete"
    end

    def update_contact(contact, new_details = {})
      ensure_on edit_admin_contact_path(contact)

      new_details.each do |field, value|
        fill_in "contact_#{field}", with: value
      end

      yield if block_given?

      find("#contact-submit").click
    end

    def create_contact(details = {})
      ensure_on new_admin_contact_path

      details.each do |field, value|
        fill_in "contact_#{field}", with: value
      end

      yield if block_given?

      find("#contact-submit").click
    end

    def contact_updated(contact, details = {})
      ensure_on edit_admin_contact_path(contact)

      details.all? { |field, value|
        has_field?("contact_#{field}", with: value)
      }
    end

    def contacts_table_selector
      "table.contacts-table"
    end

    def associated_to_contact_group(contact, contact_group)
      contact.reload.contact_groups.include?(contact_group)
    end
  end
end
