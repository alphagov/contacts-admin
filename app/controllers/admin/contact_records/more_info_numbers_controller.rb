module Admin
  module ContactRecords
    class MoreInfoNumbersController < Admin::ContactRecords::MoreInfoRecordController
      private

      def more_info_record_type
        :more_info_number
      end
    end
  end
end
