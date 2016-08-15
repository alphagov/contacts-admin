class Admin::ContactsController < AdminController
  before_filter :load_contact, only: [:edit, :update, :clone, :destroy]
  helper_method :search

  def new
    @contact = Contact.new
  end

  def index
    @contacts = search.results.includes(:contact_groups, :organisation).by_title
  end

  def update
    if @contact.update_attributes(contact_params)
      redirect_to successful_update_url, notice: "Contact successfully updated"
    else
      render :edit
    end
  end

  def clone
    cloned_contact = Admin::CloneContact.new(@contact).clone
    flash.notice = "Contact cloned"
    redirect_to edit_admin_contact_path(cloned_contact)
  end

  def create
    contact_creator = Admin::CreateContact.new(contact_params)
    if contact_creator.save
      redirect_to admin_contacts_path, notice: "Contact successfully created"
    else
      @contact = contact_creator.contact
      render :new
    end
  end

  def destroy
    if Admin::DestroyContact.new(@contact).destroy
      flash.notice = "Contact successfully deleted"
    else
      flash.alert = @contact.errors.full_messages.to_sentence
    end
    redirect_to admin_contacts_path
  end

private

  def successful_update_url
    if params[:tab].present?
      [:admin, @contact, params[:tab]]
    else
      [:edit, :admin, @contact]
    end
  end

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def search
    @search ||= ContactsSearch.new search_params
  end

  def search_params
    return {} unless params.key? :contacts_search
    params.require(:contacts_search).permit(:q, :organisation_id)
  end

  def contact_params
    params.require(:contact).permit(
      { contact_group_ids: [] },
      :organisation_id,
      :description,
      :popularity,
      :before_you_contact_us,
      :contact_information,
      :title,
      :more_info_contact_form,
      :more_info_email_address,
      :more_info_post_address,
      :more_info_phone_number,
      :online_transaction_link,
      :online_transaction_description,
      :quick_link_1,
      :quick_link_title_1,
      :quick_link_description_1,
      :quick_link_2,
      :quick_link_title_2,
      :quick_link_description_2,
      :quick_link_3,
      :quick_link_title_3,
      :quick_link_description_3,
      :query_response_time,
      { related_contact_ids: [] },
    )
  end
end
