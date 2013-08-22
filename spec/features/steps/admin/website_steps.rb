module Admin
  module WebsiteSteps
    include ::CommonSteps

    def website_exists(contact_record, website)
      ensure_on admin_contact_record_websites_path(contact_record)

      has_selector?(websites_table_selector) &&
        within(websites_table_selector) do
          has_content? website.description
        end
    end

    def delete_website(website)
      ensure_on admin_contact_record_websites_path(
        website.contact_record,
        website
      )

      within(websites_table_selector) do
        click_link 'Remove'
      end
    end

    def update_website(website, new_details = {})
      ensure_on edit_admin_contact_record_website_path(
        website.contact_record,
        website
      )

      new_details.each do |field, value|
        fill_in "website_#{field}", with: value
      end

      yield if block_given?

      find('#website-submit').click
    end

    def create_website(contact_record, details = {})
      ensure_on new_admin_contact_record_website_path(contact_record)

      details.each do |field, value|
        fill_in "website_#{field}", with: value
      end

      yield if block_given?

      find('#website-submit').click
    end

    def website_updated(website, details = {})
      ensure_on edit_admin_contact_record_website_path(
        website.contact_record,
        website
      )

      details.all? { |field, value|
        has_field?("website_#{field}", with: value)
      }
    end

    def websites_table_selector
      "table.websites-table"
    end
  end
end
