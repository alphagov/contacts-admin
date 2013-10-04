module Admin
  class ContactGroupsController < AdminController
    expose(:contact_groups)
    expose(:contact_group, attributes: :contact_group_params)

    def update
      if contact_group.update_attributes(contact_group_params)
        redirect_to admin_contact_groups_path, notice: 'Contact Group successfully updated'
      else
        render :edit
      end
    end

    def create
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
        :title,
        :department_id
      )
    end
  end
end
