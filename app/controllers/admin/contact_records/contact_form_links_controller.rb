module Admin
  module ContactRecords
    class ContactFormLinksController < AdminController
      expose(:contact_record)
      expose(:contact_form_links, ancestor: :contact_record)
      expose(:contact_form_link, attributes: :contact_form_link_params)

      def index
      end

      def new
      end

      def edit
      end

      def create
        if contact_form_link.save
          redirect_to [:admin, contact_record, :contact_form_links], notice: 'contact_form_link successfully created'
        else
          render :new
        end
      end

      def update
        if contact_form_link.update_attributes(contact_form_link_params)
          redirect_to [:admin, contact_record, :contact_form_links], notice: 'contact_form_link successfully updated'
        else
          render :edit
        end
      end

      def destroy
        contact_form_link.destroy

        redirect_to [:admin, contact_record, :contact_form_links], notice: 'contact_form_link successfully removed'
      end

      private

      def contact_form_link_params
        params.require(:contact_form_link).permit(:title, :description, :link)
      end
    end
  end
end
