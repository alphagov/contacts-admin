module Admin
  module Contacts
    class PhoneNumbersController < AdminController
      before_filter :load_parent_contact
      before_filter :load_phone_number, only: [:edit, :update, :destroy]

      def new
        @phone_number = @contact.phone_numbers.build
      end

      def create
        @phone_number = @contact.phone_numbers.build(phone_number_params)
        if @phone_number.save
          redirect_to [:admin, @contact, :phone_numbers], notice: "Phone Number successfully created"
        else
          render :new
        end
      end

      def update
        if @phone_number.update_attributes(phone_number_params)
          redirect_to [:admin, @contact, :phone_numbers], notice: "Phone Number successfully updated"
        else
          render :edit
        end
      end

      def destroy
        @phone_number.destroy
        redirect_to [:admin, @contact, :phone_numbers], notice: "Phone Number successfully deleted"
      end

    private

      def phone_number_params
        params.require(:phone_number).permit(
          :title,
          :description,
          :number,
          :open_hours,
          :best_time_to_call,
          :international_phone,
          :number_options_path,
          :international_number_options_path,
          :textphone,
          :fax
        )
      end

      def load_phone_number
        @phone_number = @contact.phone_numbers.find(params[:id])
      end
    end
  end
end
