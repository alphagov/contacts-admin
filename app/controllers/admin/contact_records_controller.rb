module Admin
  class ContactRecordsController < AdminController
    def index
      @contact_records = ContactRecord.includes(:contacts)
    end

    def edit
      @contact_record = ContactRecord.find(params[:id])
    end

    def update
      @contact_record = ContactRecord.find(params[:id])

      if @contact_record.update_attributes(contact_record_params)
        redirect_to admin_contact_records_path, notice: 'Contact Record successfully updated'
      else
        render :edit
      end
    end

    private

    def contact_record_params
      params.require(:contact_record).permit(
        :contact_type_id,
        {contact_ids: []},
        :description,
        :contact_form_url,
        :alt_meta_title,
        :alt_meta_description,
        :textphone,
        :international_phone,
        :fax,
        :email_text_head,
        :post_name,
        :post_text_head
      )
    end
  end
end
