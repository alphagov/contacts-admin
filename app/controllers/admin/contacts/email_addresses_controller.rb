module Admin
  module Contacts
    class EmailAddressesController < AdminController
      expose(:contact)
      expose(:email_addresses, ancestor: :contact)
      expose(:email_address, attributes: :email_address_params)

      before_filter :set_ariane

      def index
      end

      def new
        ariane.add "New Email Address"
      end

      def edit
        ariane.add "Editing #{email_address.title}"
      end

      def create
        ariane.add "New Email Address"

        if email_address.save
          redirect_to [:admin, contact, :email_addresses], notice: 'Email Address successfully created'
        else
          render :new
        end
      end

      def update
        ariane.add "Editing #{email_address.title}"

        if email_address.update_attributes(email_address_params)
          redirect_to [:admin, contact, :email_addresses], notice: 'Email Address successfully updated'
        else
          render :edit
        end
      end

      def destroy
        email_address.destroy

        redirect_to [:admin, contact, :email_addresses], notice: 'Email Address successfully deleted'
      end

      private

      def email_address_params
        params.require(:email_address).permit(:title, :description, :link, :email)
      end

      def set_ariane
        ariane.add 'Contacts', admin_contacts_path
        ariane.add 'Edit Contact', edit_admin_contact_path(contact)
        ariane.add 'Email Addresses'
      end
    end
  end
end
