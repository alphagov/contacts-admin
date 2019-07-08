class Admin::ContactGroupsController < AdminController
  before_action :load_contact_group, only: %i[edit update destroy]

  def new
    @contact_group = ContactGroup.new
  end

  def index
    @contact_groups = ContactGroup.all
  end

  def edit; end

  def update
    if @contact_group.update(contact_group_params)
      republish_finders
      redirect_to admin_contact_groups_path, notice: "Contact Group successfully updated"
    else
      render :edit
    end
  end

  def create
    @contact_group = ContactGroup.new(contact_group_params)
    if @contact_group.save
      republish_finders
      redirect_to admin_contact_groups_path, notice: "Contact Group successfully created"
    else
      render :new
    end
  end

  def destroy
    if Admin::DestroyContactGroup.new(@contact_group).destroy
      republish_finders
      flash.notice = "Contact Group successfully deleted"
    else
      flash.alert = @contact_group.errors.full_messages.to_sentence
    end

    redirect_to admin_contact_groups_path
  end

private

  def load_contact_group
    @contact_group = ContactGroup.find(params[:id])
  end

  def contact_group_params
    params.require(:contact_group).permit(
      :contact_group_type_id,
      :description,
      :title,
      :organisation_id
    )
  end

  def republish_finders
    PublishFinders.call
  end
end
