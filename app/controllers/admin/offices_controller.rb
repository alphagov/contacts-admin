module Admin
  class OfficesController < AdminController
    expose(:offices) { Office.includes(:contact) }
    expose(:office, attributes: :office_params)

    before_filter :set_ariane

    def index
    end

    def edit
      ariane.add "Editing #{office}"
    end

    def new
      ariane.add 'New Office'
    end

    def update
      ariane.add "Editing #{office}"
      
      if office.update_attributes(office_params)
        redirect_to admin_offices_path, notice: 'Office successfully updated'
      else
        render :edit
      end
    end

    def create
      ariane.add 'New Office'

      if office.save
        redirect_to admin_offices_path, notice: 'Office successfully created'
      else
        render :new
      end
    end

    def destroy
      office.destroy

      redirect_to admin_offices_path, notice: 'Office was successfully deleted'
    end

    private

    def office_params
      params.require(:office).permit(
        :title,
        :department_id,
        :contact_id
      )
    end

    def set_ariane
      ariane.add 'Offices', admin_offices_path
    end
  end
end
