module Admin
  module MoreInfoRecordSteps
    def more_info_record_exists(contact_record)
      ensure_on edit_admin_contact_record_path(contact_record)

      !has_selector?(new_more_info_record_link)
    end

    def create_more_info_record(more_info_type, contact_record, details = {})
      ensure_on polymorphic_path([:new, :admin, contact_record, more_info_type])

      details.each do |field, value|
        fill_in "#{more_info_type}_#{field}", with: value
      end

      yield if block_given?

      find('#more-info-record-submit').click
    end

    def update_more_info_record(more_info_type, contact_record, new_details = {})
      ensure_on polymorphic_path([:edit, :admin, contact_record, more_info_type])

      new_details.each do |field, value|
        fill_in "#{more_info_type}_#{field}", with: value
      end

      yield if block_given?

      find('#more-info-record-submit').click
    end

    def more_info_record_updated(more_info_type, contact_record, details = {})
      ensure_on polymorphic_path([:edit, :admin, contact_record, more_info_type])

      details.all? { |field, value|
        has_field?("#{more_info_type}_#{field}", with: value)
      }
    end
  end
end
