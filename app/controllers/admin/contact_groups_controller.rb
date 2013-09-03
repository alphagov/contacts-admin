module Admin
  class ContactGroupsController < AdminController
    expose(:contact_groups)
    expose(:contact_group, attributes: :contact_group_params)

    before_filter :set_ariane

    def index
    end

    def edit
      ariane.add "Editing #{contact_group}"
    end

    def new
      ariane.add 'New Contact Group'
    end

    def update
      ariane.add "Editing #{contact_group}"
      
      if contact_group.update_attributes(contact_group_params)
        redirect_to admin_contact_groups_path, notice: 'Contact Group successfully updated'
      else
        render :edit
      end
    end

    def create
      ariane.add 'New Contact Group'

      if contact_group.save
        redirect_to admin_contact_groups_path, notice: 'Contact Group successfully created'
      else
        render :new
      end
    end

    def destroy
      if Admin::DestroyContactGroup.new(contact_group).destroy
        flash.notice = 'Contact Group successfully deleted'
      else
        flash.alert = 'Cannot delete contact group'
      end

      redirect_to admin_contact_groups_path
    end

    private

    def contact_group_params
      params.require(:contact_group).permit(
        :contact_group_type_id,
        :description,
        :title
      )
    end

    def set_ariane
      ariane.add 'Contact Groups', admin_contact_groups_path
    end
  end
end
