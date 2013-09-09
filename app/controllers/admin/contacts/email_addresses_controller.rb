module Admin
  module Contacts
    class EmailAddressesController < AdminController
      expose(:contact)
      expose(:email_addresses, ancestor: :contact)
      expose(:email_address, attributes: :email_address_params)

      def create
        if email_address.save
          redirect_to [:admin, contact, :email_addresses], notice: 'Email Address successfully created'
        else
          render :new
        end
      end

      def update
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
    end
  end
end
