module Admin
  module ContactFormLinkSteps
    include ::CommonSteps

    def contact_form_link_exists(contact, contact_form_link)
      ensure_on admin_contact_contact_form_links_path(contact)

      has_selector?(contact_form_links_table_selector) &&
        within(contact_form_links_table_selector) do
          has_content? contact_form_link.description
        end
    end

    def delete_contact_form_link(contact_form_link)
      ensure_on edit_admin_contact_contact_form_link_path(
        contact_form_link.contact,
        contact_form_link
      )

      click_link "Delete"
    end

    def update_contact_form_link(contact_form_link, new_details = {})
      ensure_on edit_admin_contact_contact_form_link_path(
        contact_form_link.contact,
        contact_form_link
      )

      new_details.each do |field, value|
        fill_in "contact_form_link_#{field}", with: value
      end

      yield if block_given?

      find("#contact-form-link-submit").click
    end

    def create_contact_form_link(contact, details = {})
      ensure_on new_admin_contact_contact_form_link_path(contact)

      details.each do |field, value|
        fill_in "contact_form_link_#{field}", with: value
      end

      yield if block_given?

      find("#contact-form-link-submit").click
    end

    def contact_form_link_updated(contact_form_link, details = {})
      ensure_on edit_admin_contact_contact_form_link_path(
        contact_form_link.contact,
        contact_form_link
      )

      details.all? { |field, value|
        has_field?("contact_form_link_#{field}", with: value)
      }
    end

    def contact_form_links_table_selector
      "table.contact-form-links-table"
    end
  end
end
