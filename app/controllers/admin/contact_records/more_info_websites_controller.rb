module Admin
  module ContactRecords
    class MoreInfoWebsitesController < AdminController
      expose(:contact_record)

      def new
        @more_info_website = contact_record.build_more_info_website
      end

      def create
        @more_info_website = contact_record.build_more_info_website(more_info_attributes)

        if @more_info_website.save
          redirect_to [:edit, :admin, contact_record], notice: 'More Info Website record successfully created'
        else
          render :new
        end
      end

      def edit
        @more_info_website = contact_record.more_info_website
      end

      def update
        @more_info_website = contact_record.more_info_website

        if @more_info_website.update_attributes(more_info_attributes)
          redirect_to [:edit, :admin, contact_record], notice: 'More Info Website record successfully updated'
        else
          render :new
        end
      end

      def destroy
      end

      protected

      def more_info_attributes
        params.require(:more_info_website).permit(
          :description,
          :url_title,
          :url_description,
          :url
        )
      end
    end
  end
end
