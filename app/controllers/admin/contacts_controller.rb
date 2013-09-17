module Admin
  class ContactsController < AdminController
    expose(:contacts)
    expose(:contact, attributes: :contact_params)

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

    def destroy
      contact.destroy

      redirect_to admin_contacts_path, notice: 'Contact was successfully deleted'
    end

    private

    def contact_params
      params.require(:contact).permit(
        :contact_group_id,
        :department_id,
        :description,
        :before_you_contact_us,
        :contact_information,
        :title,
        :more_info_contact_form,
        :more_info_email_address,
        :more_info_post_address,
        :more_info_phone_number
      )
    end
  end
end
