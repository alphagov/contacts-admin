module Admin
  module ContactSteps
    include ::CommonSteps

    def contact_exists(contact)
      ensure_on admin_contacts_path

      has_selector?(contacts_table_selector) &&
        within(contacts_table_selector) do
          has_content? contact.title
        end
    end

    def delete_contact(contact)
      ensure_on admin_contacts_path

      within(contacts_table_selector) do
        click_link 'Remove'
      end
    end

    def update_contact(contact, new_details = {})
      ensure_on edit_admin_contact_path(contact)

      new_details.each do |field, value|
        fill_in "contact_#{field}", with: value
      end

      yield if block_given?

      click_button 'Update Contact'
    end

    def create_contact(details = {})
      ensure_on new_admin_contact_path

      details.each do |field, value|
        fill_in "contact_#{field}", with: value
      end

      yield if block_given?

      click_button 'Create Contact'
    end

    def contact_updated(contact, details = {})
      ensure_on edit_admin_contact_path(contact)

      details.all? { |field, value|
        has_field?("contact_#{field}", with: value)
      }
    end

    def contacts_table_selector
      "table.contact-table"
    end
  end
end
