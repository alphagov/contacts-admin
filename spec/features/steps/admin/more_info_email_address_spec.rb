module Admin
  module MoreInfoEmailAddressSteps
    include ::CommonSteps

    def more_info_email_address_exists(contact_record)
      ensure_on edit_admin_contact_record_path(contact_record)

      !has_selector?(new_more_info_email_address_link)
    end

    def new_more_info_email_address_link
      'a.new-more-info-email-address'
    end

    def create_more_info_email_address(contact_record, details = {})
      ensure_on new_admin_contact_record_more_info_email_address_path(contact_record)

      details.each do |field, value|
        fill_in "more_info_email_address_#{field}", with: value
      end

      yield if block_given?

      find('#more-info-record-submit').click
    end

    def update_more_info_email_address(contact_record, new_details = {})
      ensure_on edit_admin_contact_record_more_info_email_address_path(contact_record)

      new_details.each do |field, value|
        fill_in "more_info_email_address_#{field}", with: value
      end

      yield if block_given?

      find('#more-info-record-submit').click
    end

    def more_info_email_address_updated(contact_record, details = {})
      ensure_on edit_admin_contact_record_more_info_email_address_path(contact_record)

      details.all? { |field, value|
        has_field?("more_info_email_address_#{field}", with: value)
      }
    end
  end
end
