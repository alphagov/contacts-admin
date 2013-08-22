module Admin
  module ContactRecords
    class PostAddressesController < AdminController
      expose(:contact_record)
      expose(:post_addresses, ancestor: :contact_record)
      expose(:post_address, attributes: :post_address_params)

      def index
      end

      def new
      end

      def edit
      end

      def create
        if post_address.save
          redirect_to [:admin, contact_record, :post_addresses], notice: 'Post Address successfully created'
        else
          render :new
        end
      end

      def update
        if post_address.update_attributes(post_address_params)
          redirect_to [:admin, contact_record, :post_addresses], notice: 'Post Address successfully updated'
        else
          render :edit
        end
      end

      def destroy
        post_address.destroy

        redirect_to [:admin, contact_record, :post_addresses], notice: 'Post Address successfully removed'
      end

      private

      def post_address_params
        params.require(:post_address).permit(:title, :description, :address)
      end
    end
  end
end
