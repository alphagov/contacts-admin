module Admin
  class ContactsController < AdminController
    expose(:contacts)
    expose(:contact, attributes: :contact_params)

    before_filter :set_ariane

    def index
    end

    def edit
      ariane.add "Editing #{contact}"
    end

    def new
      ariane.add "New Contact"
    end

    def update
      ariane.add "Editing #{contact}"

      if contact.update_attributes(contact_params)
        redirect_to admin_contacts_path, notice: 'Contact successfully updated'
      else
        render :edit
      end
    end

    def create
      ariane.add "New Contact"

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
        :contact_information,
        :title,
        :more_info_website,
        :more_info_email_address,
        :more_info_post_address,
        :more_info_phone_number
      )
    end

    def set_ariane
      ariane.add 'Contacts', admin_contacts_path
    end
  end
end
