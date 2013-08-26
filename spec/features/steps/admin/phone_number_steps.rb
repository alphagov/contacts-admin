module Admin
  module PhoneNumberSteps
    include ::CommonSteps

    def phone_number_exists(contact_record, number)
      ensure_on admin_contact_record_phone_numbers_path(contact_record)

      has_selector?(phone_numbers_table_selector) &&
        within(phone_numbers_table_selector) do
          has_content? number.description
        end
    end

    def delete_phone_number(number)
      ensure_on admin_contact_record_phone_numbers_path(
        number.contact_record,
        number
      )

      within(phone_numbers_table_selector) do
        click_link 'Remove'
      end
    end

    def update_phone_number(number, new_details = {})
      ensure_on edit_admin_contact_record_phone_number_path(
        number.contact_record,
        number
      )

      new_details.each do |field, value|
        fill_in "phone_number_#{field}", with: value
      end

      yield if block_given?

      find('#phone-number-submit').click
    end

    def create_phone_number(contact_record, details = {})
      ensure_on new_admin_contact_record_phone_number_path(contact_record)

      details.each do |field, value|
        fill_in "phone_number_#{field}", with: value
      end

      yield if block_given?

      find('#phone-number-submit').click
    end

    def phone_number_updated(number, details = {})
      ensure_on edit_admin_contact_record_phone_number_path(
        number.contact_record,
        number
      )

      details.all? { |field, value|
        has_field?("phone_number_#{field}", with: value)
      }
    end

    def phone_numbers_table_selector
      "table.phone-numbers-table"
    end
  end
end
