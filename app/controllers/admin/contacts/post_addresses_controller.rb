module Admin
  module Contacts
    class PostAddressesController < AdminController
      expose(:contact)
      expose(:post_addresses, ancestor: :contact)
      expose(:post_address, attributes: :post_address_params)

      before_filter :set_ariane

      def index
      end

      def new
        ariane.add "New Postal Address"
      end

      def edit
        ariane.add "Editing #{post_address.title}"
      end

      def create
        ariane.add "New Postal Address"
        
        if post_address.save
          redirect_to [:admin, contact, :post_addresses], notice: 'Post Address successfully created'
        else
          render :new
        end
      end

      def update
        ariane.add "Editing #{post_address.title}"

        if post_address.update_attributes(post_address_params)
          redirect_to [:admin, contact, :post_addresses], notice: 'Post Address successfully updated'
        else
          render :edit
        end
      end

      def destroy
        post_address.destroy

        redirect_to [:admin, contact, :post_addresses], notice: 'Post Address successfully removed'
      end

      private

      def post_address_params
        params.require(:post_address).permit(:title, :description, :address)
      end

      def set_ariane
        ariane.add 'Contacts', admin_contacts_path
        ariane.add 'Edit Contact', edit_admin_contact_path(contact)
        ariane.add 'Postal Addresses'
      end
    end
  end
end
