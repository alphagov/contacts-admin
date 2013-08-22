module Admin
  module NumberSteps
    include ::CommonSteps

    def number_exists(contact_record, number)
      ensure_on admin_contact_record_numbers_path(contact_record)

      has_selector?(numbers_table_selector) &&
        within(numbers_table_selector) do
          has_content? number.description
        end
    end

    def delete_number(number)
      ensure_on admin_contact_record_numbers_path(
        number.contact_record,
        number
      )

      within(numbers_table_selector) do
        click_link 'Remove'
      end
    end

    def update_number(number, new_details = {})
      ensure_on edit_admin_contact_record_number_path(
        number.contact_record,
        number
      )

      new_details.each do |field, value|
        fill_in "number_#{field}", with: value
      end

      yield if block_given?

      find('#number-submit').click
    end

    def create_number(contact_record, details = {})
      ensure_on new_admin_contact_record_number_path(contact_record)

      details.each do |field, value|
        fill_in "number_#{field}", with: value
      end

      yield if block_given?

      find('#number-submit').click
    end

    def number_updated(number, details = {})
      ensure_on edit_admin_contact_record_number_path(
        number.contact_record,
        number
      )

      details.all? { |field, value|
        has_field?("number_#{field}", with: value)
      }
    end

    def numbers_table_selector
      "table.numbers-table"
    end
  end
end
