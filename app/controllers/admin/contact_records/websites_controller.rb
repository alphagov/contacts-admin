module Admin
  module ContactRecords
    class WebsitesController < AdminController
      expose(:contact_record)
      expose(:websites, ancestor: :contact_record)
      expose(:website, attributes: :website_params)

      def index
      end

      def new
      end

      def edit
      end

      def create
        if website.save
          redirect_to [:admin, contact_record, :websites], notice: 'Website successfully created'
        else
          render :new
        end
      end

      def update
        if website.update_attributes(website_params)
          redirect_to [:admin, contact_record, :websites], notice: 'Website successfully updated'
        else
          render :edit
        end
      end

      def destroy
        website.destroy

        redirect_to [:admin, contact_record, :websites], notice: 'Website successfully removed'
      end

      private

      def website_params
        params.require(:website).permit(:title, :description, :link)
      end
    end
  end
end
