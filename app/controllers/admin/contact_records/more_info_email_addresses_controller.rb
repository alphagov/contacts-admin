module Admin
  module ContactRecords
    class MoreInfoEmailAddressesController < Admin::ContactRecords::MoreInfoRecordController
      private

      def more_info_record_type
        :more_info_email_address
      end
    end
  end
end
