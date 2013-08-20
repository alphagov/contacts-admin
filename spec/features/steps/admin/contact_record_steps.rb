module Admin
  module ContactRecordSteps
    include ::CommonSteps

    def contact_record_exists(contact_record)
      ensure_on admin_contact_records_path

      has_selector?(contact_records_table_selector) &&
        within(contact_records_table_selector) do
          has_content? contact_record.description
        end
    end

    def delete_contact_record(contact_record)
      ensure_on admin_contact_records_path

      within(contact_records_table_selector) do
        click_link 'Remove'
      end
    end

    def update_contact_record(contact_record, new_details = {})
      ensure_on edit_admin_contact_record_path(contact_record)

      new_details.each do |field, value|
        fill_in "contact_record_#{field}", with: value
      end

      yield if block_given?

      click_button 'Update Contact record'
    end

    def create_contact_record(details = {})
      ensure_on new_admin_contact_record_path

      details.each do |field, value|
        fill_in "contact_record_#{field}", with: value
      end

      yield if block_given?

      click_button 'Create contact_record'
    end

    def contact_record_updated(contact_record, details = {})
      ensure_on edit_admin_contact_record_path(contact_record)

      details.all? { |field, value|
        has_field?("contact_record_#{field}", with: value)
      }
    end

    def contact_records_table_selector
      "table.contact-records-table"
    end
  end
end
