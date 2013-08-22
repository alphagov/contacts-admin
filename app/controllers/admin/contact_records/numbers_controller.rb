module Admin
  module ContactRecords
    class NumbersController < AdminController
      expose(:contact_record)
      expose(:numbers, ancestor: :contact_record)
      expose(:number, attributes: :number_params)

      def index
      end

      def new
      end

      def edit
      end

      def create
        if number.save
          redirect_to [:admin, contact_record, :numbers], notice: 'Number successfully created'
        else
          render :new
        end
      end

      def update
        if number.update_attributes(number_params)
          redirect_to [:admin, contact_record, :numbers], notice: 'Number successfully updated'
        else
          render :edit
        end
      end

      def destroy
        number.destroy

        redirect_to [:admin, contact_record, :numbers], notice: 'Number successfully removed'
      end

      private

      def number_params
        params.require(:number).permit(
          :title,
          :description,
          :number,
          :open_hours
        )
      end
    end
  end
end
