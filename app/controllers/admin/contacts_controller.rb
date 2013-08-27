module Admin
  class ContactsController < AdminController
    def index
      @contacts = Contact.includes(:offices)
    end

    def edit
      @contact = Contact.find(params[:id])
    end

    def new
      @contact = Contact.new
    end

    def update
      @contact = Contact.find(params[:id])

      if @contact.update_attributes(contact_params)
        redirect_to admin_contacts_path, notice: 'Contact Record successfully updated'
      else
        render :edit
      end
    end

    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to admin_contacts_path, notice: 'Contact Record successfully created'
      else
        render :new
      end
    end

    private

    def contact_params
      params.require(:contact).permit(
        :contact_type_id,
        {office_ids: []},
        :description,
        :contact_information,
        :meta_title,
        :meta_description,
        :more_info_website,
        :more_info_email_address,
        :more_info_post_address,
        :more_info_phone_number
      )
    end
  end
end
