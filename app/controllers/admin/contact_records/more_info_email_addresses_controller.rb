module Admin
  module ContactRecords
    class MoreInfoEmailAddressesController < Admin::ContactRecords::MoreInfoRecordController
      def new
        @more_info_email_address = contact_record.build_more_info_email_address
      end

      def create
        @more_info_email_address = contact_record.build_more_info_email_address(more_info_attributes)

        if @more_info_email_address.save
          redirect_to [:edit, :admin, contact_record], notice: 'More Info Website record successfully created'
        else
          render :new
        end
      end

      def edit
        @more_info_email_address = contact_record.more_info_email_address
      end

      def update
        @more_info_email_address = contact_record.more_info_email_address

        if @more_info_email_address.update_attributes(more_info_attributes)
          redirect_to [:edit, :admin, contact_record], notice: 'More Info Website record successfully updated'
        else
          render :new
        end
      end

      def destroy
      end
    end
  end
end
