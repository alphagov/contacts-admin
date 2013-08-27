module Admin
  module OfficeSteps
    include ::CommonSteps

    def office_exists(office)
      ensure_on admin_offices_path

      has_selector?(offices_table_selector) &&
        within(offices_table_selector) do
          has_content? office.title
        end
    end

    def delete_office(office)
      ensure_on admin_offices_path

      within(offices_table_selector) do
        click_link 'Remove'
      end
    end

    def update_office(office, new_details = {})
      ensure_on edit_admin_office_path(office)

      new_details.each do |field, value|
        fill_in "office_#{field}", with: value
      end

      yield if block_given?

      find('#office-submit').click
    end

    def create_office(details = {})
      ensure_on new_admin_office_path

      details.each do |field, value|
        fill_in "office_#{field}", with: value
      end

      yield if block_given?

      find('#office-submit').click
    end

    def office_updated(office, details = {})
      ensure_on edit_admin_office_path(office)

      details.all? { |field, value|
        has_field?("office_#{field}", with: value)
      }
    end

    def offices_table_selector
      "table.office-table"
    end

    def associated_to_department(office, department)
      office.reload.department == department
    end

    def associated_to_contact(office, contact)
      office.reload.contact == contact
    end
  end
end
