module Admin
  module ContactGroupSteps
    include ::CommonSteps

    def contact_group_exists(contact_group)
      ensure_on admin_contact_groups_path

      has_selector?(contact_groups_table_selector) &&
        within(contact_groups_table_selector) do
          has_content? contact_group.description
        end
    end

    def delete_contact_group(contact_group)
      ensure_on edit_admin_contact_group_path(contact_group)

      click_link "Delete"
    end

    def update_contact_group(contact_group, new_details = {})
      ensure_on edit_admin_contact_group_path(contact_group)

      new_details.each do |field, value|
        fill_in "contact_group_#{field}", with: value
      end

      yield if block_given?

      find("#contact-group-submit").click
    end

    def create_contact_group(details = {})
      ensure_on new_admin_contact_group_path

      details.each do |field, value|
        fill_in "contact_group_#{field}", with: value
      end

      yield if block_given?

      find("#contact-group-submit").click
    end

    def contact_group_updated(contact_group, details = {})
      ensure_on edit_admin_contact_group_path(contact_group)

      details.all? { |field, value|
        has_field?("contact_group_#{field}", with: value)
      }
    end

    def contact_groups_table_selector
      "table.contact-groups-table"
    end
  end
end
