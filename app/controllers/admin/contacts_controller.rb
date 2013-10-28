module Admin
  class ContactsController < AdminController
    expose(:contacts)
    expose(:contact, attributes: :contact_params)

    def update
      if contact.update_attributes(contact_params)
        redirect_to edit_admin_contact_path(contact), notice: 'Contact successfully updated'
      else
        render :edit
      end
    end

    def clone
      contact = Contact.find(params[:id])
      cloned_contact = Admin::CloneContact.new(contact).clone
      flash.notice = 'Contact cloned'
      redirect_to edit_admin_contact_path(cloned_contact)
    end

    def create
      if contact.save
        redirect_to admin_contacts_path, notice: 'Contact successfully created'
      else
        render :new
      end
    end

    def destroy
      if Admin::DestroyContact.new(contact).destroy
        flash.notice = 'Contact successfully deleted'
      else
        flash.alert = contact.errors.full_messages.to_sentence
      end
      redirect_to admin_contacts_path
    end

    private

    def contact_params
      params.require(:contact).permit(
        {contact_group_ids: []},
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
