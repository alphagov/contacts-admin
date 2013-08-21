module Admin
  module MoreInfoWebsiteSteps
    include ::CommonSteps

    def more_info_website_exists(contact_record)
      ensure_on edit_admin_contact_record_path(contact_record)

      !has_selector?(new_more_info_website_link)
    end

    def new_more_info_website_link
      'a.new-more-info-website'
    end

    def create_more_info_website(contact_record, details = {})
      ensure_on new_admin_contact_record_more_info_website_path(contact_record)

      details.each do |field, value|
        fill_in "more_info_website_#{field}", with: value
      end

      yield if block_given?

      find('#more-info-record-submit').click
      # click_button 'Create Contact record'
    end

    # def delete_contact_record(contact_record)
    #   ensure_on admin_contact_records_path

    #   within(contact_records_table_selector) do
    #     click_link 'Remove'
    #   end
    # end

    # def update_contact_record(contact_record, new_details = {})
    #   ensure_on edit_admin_contact_record_path(contact_record)

    #   new_details.each do |field, value|
    #     fill_in "contact_record_#{field}", with: value
    #   end

    #   yield if block_given?

    #   click_button 'Update Contact record'
    # end

    # def contact_record_updated(contact_record, details = {})
    #   ensure_on edit_admin_contact_record_path(contact_record)

    #   details.all? { |field, value|
    #     has_field?("contact_record_#{field}", with: value)
    #   }
    # end

    # def contact_records_table_selector
    #   "table.contact-records-table"
    # end

    # def associated_to_contact_type(contact_record, contact_type)
    #   contact_record.reload.contact_type == contact_type
    # end

    # def associated_to_contacts(contact_record, *contacts)
    #   contacts.all? { |contact|
    #     contact_record.reload.contacts.include?(contact)
    #   }
    # end
  end
end
