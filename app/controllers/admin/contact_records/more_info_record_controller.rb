module Admin
  module ContactRecords
    class MoreInfoRecordController < AdminController
      expose(:contact_record)

      def new
        @more_info_record = build_more_info_record
      end

      def create
        @more_info_record = build_more_info_record(more_info_attributes)

        if @more_info_record.save
          redirect_to [:edit, :admin, contact_record], notice: 'More Info record successfully created'
        else
          render :new
        end
      end

      def edit
        @more_info_record = fetch_more_info_record
      end

      def update
        @more_info_record = fetch_more_info_record

        if @more_info_record.update_attributes(more_info_attributes)
          redirect_to [:edit, :admin, contact_record], notice: 'More Info record successfully updated'
        else
          render :edit
        end
      end

      private

      def build_more_info_record(attributes = {})
        contact_record.send(:"build_#{more_info_record_type}", attributes)
      end

      def fetch_more_info_record
        contact_record.send(more_info_record_type)
      end

      def more_info_attributes
        params.require(more_info_record_type).permit(
          :description,
          :url_title,
          :url_description,
          :url
        )
      end

      def more_info_record_type
        raise NotImplementedError.new("Should be overriden by inheriting classes")
      end
    end
  end
end
