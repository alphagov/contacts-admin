module Admin
  module Contacts
    class PhoneNumbersController < AdminController
      expose(:contact)
      expose(:phone_numbers, ancestor: :contact)
      expose(:phone_number, attributes: :phone_number_params)

      def create
        if phone_number.save
          redirect_to [:admin, contact, :phone_numbers], notice: 'Phone Number successfully created'
        else
          render :new
        end
      end

      def update
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
    end
  end
end
