module Admin
  module ContactRecords
    class MoreInfoPostAddressesController < Admin::ContactRecords::MoreInfoRecordController
      private

      def more_info_record_type
        :more_info_post_address
      end
    end
  end
end
