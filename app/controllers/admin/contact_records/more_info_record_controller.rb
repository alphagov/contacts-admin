module Admin
  module ContactRecords
    class MoreInfoRecordController < AdminController
      expose(:contact_record)

      protected

      def more_info_attributes
        params.require(:more_info_email_address).permit(
          :description,
          :url_title,
          :url_description,
          :url
        )
      end
    end
  end
end
