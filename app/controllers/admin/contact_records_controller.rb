module Admin
  class ContactRecordsController < AdminController
    def index
      @contact_records = ContactRecord.includes(:contacts)
    end

    def edit
      @contact_record = ContactRecord.with_more_info_records.find(params[:id])
    end

    def new
      @contact_record = ContactRecord.new
    end

    def update
      @contact_record = ContactRecord.find(params[:id])

      if @contact_record.update_attributes(contact_record_params)
        redirect_to admin_contact_records_path, notice: 'Contact Record successfully updated'
      else
        render :edit
      end
    end

    def create
      @contact_record = ContactRecord.new(contact_record_params)

      if @contact_record.save
        redirect_to admin_contact_records_path, notice: 'Contact Record successfully created'
      else
        render :new
      end
    end

    private

    def contact_record_params
      params.require(:contact_record).permit(
        :contact_type_id,
        {contact_ids: []},
        :description,
        :contact_information,
        :meta_title,
        :meta_description,
      )
    end
  end
end
