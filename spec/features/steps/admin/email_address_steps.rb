module Admin
  module EmailAddressSteps
    include ::CommonSteps

    def email_address_exists(contact, email_address)
      ensure_on admin_contact_email_addresses_path(contact)

      has_selector?(email_addresses_table_selector) &&
        within(email_addresses_table_selector) do
          has_content? email_address.description
        end
    end

    def delete_email_address(email_address)
      ensure_on admin_contact_email_addresses_path(
        email_address.contact,
        email_address
      )

      within(email_addresses_table_selector) do
        click_link 'Remove'
      end
    end

    def update_email_address(email_address, new_details = {})
      ensure_on edit_admin_contact_email_address_path(
        email_address.contact,
        email_address
      )

      new_details.each do |field, value|
        fill_in "email_address_#{field}", with: value
      end

      yield if block_given?

      find('#email-address-submit').click
    end

    def create_email_address(contact, details = {})
      ensure_on new_admin_contact_email_address_path(contact)

      details.each do |field, value|
        fill_in "email_address_#{field}", with: value
      end

      yield if block_given?

      find('#email-address-submit').click
    end

    def email_address_updated(email_address, details = {})
      ensure_on edit_admin_contact_email_address_path(
        email_address.contact,
        email_address
      )

      details.all? { |field, value|
        has_field?("email_address_#{field}", with: value)
      }
    end

    def email_addresses_table_selector
      "table.email-addresses-table"
    end
  end
end
