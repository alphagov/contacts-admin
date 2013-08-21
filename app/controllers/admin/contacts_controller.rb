module Admin
  class ContactsController < AdminController
    def index
      @contacts = Contact.includes(:contact_record)
    end

    def edit
      @contact = Contact.find(params[:id])
    end

    def new
      @contact = Contact.new
    end

    def update
      @contact = Contact.find(params[:id])

      if @contact.update_attributes(contact_params)
        redirect_to admin_contacts_path, notice: 'Contact successfully updated'
      else
        render :edit
      end
    end

    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to admin_contacts_path, notice: 'Contact successfully created'
      else
        render :new
      end
    end

    private

    def contact_params
      params.require(:contact).permit(
        :title,
        :department_id,
        :contact_record_id
      )
    end
  end
end
