module Admin
  class ContactsController < AdminController
    expose(:contacts) { Contact.includes(:offices) }
    expose(:contact, attributes: :contact_params)

    def index
    end

    def edit
    end

    def new
    end

    def update
      if contact.update_attributes(contact_params)
        redirect_to admin_contacts_path, notice: 'Contact successfully updated'
      else
        render :edit
      end
    end

    def create
      if contact.save
        redirect_to admin_contacts_path, notice: 'Contact successfully created'
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
