module Admin
  class OfficesController < AdminController
    expose(:offices) { Office.includes(:contact_record) }
    expose(:office, attributes: :office_params)

    def index
    end

    def edit
    end

    def new
    end

    def update
      if office.update_attributes(office_params)
        redirect_to admin_offices_path, notice: 'Office successfully updated'
      else
        render :edit
      end
    end

    def create
      if office.save
        redirect_to admin_offices_path, notice: 'Office successfully created'
      else
        render :new
      end
    end

    private

    def office_params
      params.require(:office).permit(
        :title,
        :department_id,
        :contact_record_id
      )
    end
  end
end
