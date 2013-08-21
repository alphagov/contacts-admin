module Admin
  module ContactRecords
    class MoreInfoWebsitesController < Admin::ContactRecords::MoreInfoRecordController
      private

      def more_info_record_type
        :more_info_website
      end
    end
  end
end
