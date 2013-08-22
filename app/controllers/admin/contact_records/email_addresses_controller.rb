module Admin
  module ContactRecords
    class EmailAddressesController < AdminController
      expose(:contact_record)
      expose(:email_addresses, ancestor: :contact_record)
      expose(:email_address, attributes: :email_address_params)

      def index
      end

      def new
      end

      def edit
      end

      def create
        if email_address.save
          redirect_to [:admin, contact_record, :email_addresses], notice: 'Email Address successfully created'
        else
          render :new
        end
      end

      def update
        if email_address.update_attributes(email_address_params)
          redirect_to [:admin, contact_record, :email_addresses], notice: 'Email Address successfully updated'
        else
          render :edit
        end
      end

      def destroy
        email_address.destroy

        redirect_to [:admin, contact_record, :email_addresses], notice: 'Email Address successfully removed'
      end

      private

      def email_address_params
        params.require(:email_address).permit(:title, :description, :link, :email)
      end
    end
  end
end
