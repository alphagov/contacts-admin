module Admin
  module Contacts
    class PhoneNumbersController < AdminController
      expose(:contact)
      expose(:phone_numbers, ancestor: :contact)
      expose(:phone_number, attributes: :phone_number_params)

      before_filter :set_ariane

      def index
      end

      def new
        ariane.add 'New Phone Number'
      end

      def edit
        ariane.add "Editing #{phone_number.title}"
      end

      def create
        ariane.add 'New Phone Number'

        if phone_number.save
          redirect_to [:admin, contact, :phone_numbers], notice: 'Phone Number successfully created'
        else
          render :new
        end
      end

      def update
        ariane.add "Editing #{phone_number.title}"

        if phone_number.update_attributes(phone_number_params)
          redirect_to [:admin, contact, :phone_numbers], notice: 'Phone Number successfully updated'
        else
          render :edit
        end
      end

      def destroy
        phone_number.destroy

        redirect_to [:admin, contact, :phone_numbers], notice: 'Phone Number successfully deleted'
      end

      private

      def phone_number_params
        params.require(:phone_number).permit(
          :title,
          :description,
          :number,
          :open_hours,
          :international_phone,
          :number_options_path,
          :international_number_options_path,
          :textphone,
          :fax
        )
      end

      def set_ariane
        ariane.add 'Contacts', admin_contacts_path
        ariane.add 'Edit Contact', edit_admin_contact_path(contact)
        ariane.add 'Phone Numbers', admin_contact_phone_numbers_path(contact)
      end
    end
  end
end
