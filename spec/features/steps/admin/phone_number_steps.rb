module Admin
  module PhoneNumberSteps
    include ::CommonSteps

    def phone_number_exists(contact, number)
      ensure_on admin_contact_phone_numbers_path(contact)

      has_selector?(phone_numbers_table_selector) &&
        within(phone_numbers_table_selector) do
          has_content? number.title
        end
    end

    def delete_phone_number(number)
      ensure_on edit_admin_contact_phone_number_path(
        number.contact,
        number,
      )

      click_link "Delete"
    end

    def update_phone_number(number, new_details = {})
      ensure_on edit_admin_contact_phone_number_path(
        number.contact,
        number,
      )

      new_details.each do |field, value|
        fill_in "phone_number_#{field}", with: value
      end

      yield if block_given?

      find("#phone-number-submit").click
    end

    def create_phone_number(contact, details = {})
      ensure_on new_admin_contact_phone_number_path(contact)

      details.each do |field, value|
        fill_in "phone_number_#{field}", with: value
      end

      yield if block_given?

      find("#phone-number-submit").click
    end

    def phone_number_updated(number, details = {})
      ensure_on edit_admin_contact_phone_number_path(
        number.contact,
        number,
      )

      details.all? do |field, value|
        has_field?("phone_number_#{field}", with: value)
      end
    end

    def phone_numbers_table_selector
      "table.phone-numbers-table"
    end
  end
end
