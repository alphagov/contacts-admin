class Admin::ContactsController < AdminController
  before_action :load_contact, only: %i[edit update clone delete destroy]
  helper_method :search

  def new
    @contact = Contact.new
  end

  def index
    @contacts = search.results.includes(:contact_groups, :organisation).by_title
  end

  def edit; end

  def update
    if @contact.update(contact_params)
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

  def delete; end

  def destroy
    if (valid_path = redirect_path(params[:redirect_url]))
      if Admin::DestroyAndRedirectContact.new(@contact, valid_path).destroy_and_redirect
        flash.notice = "Contact successfully deleted"
        redirect_to admin_contacts_path
      else
        flash.alert = @contact.errors.full_messages.to_sentence
        redirect_to delete_admin_contact_path
      end
    else
      flash.alert = "Invalid redirect URL. Redirects must be internal links, e.g. /world"
      redirect_to delete_admin_contact_path
    end
  end

private

  def redirect_path(url)
    uri = URI.parse(url)
    return uri.path if uri.host.nil?

    redirect_host = if uri.host.match(/^www\./)
                      uri.host
                    else
                      "www.#{uri.host}"
                    end
    website_root_host = URI(Plek.website_root).host
    uri.path if redirect_host == website_root_host
  rescue URI::InvalidURIError
    false
  end

  def successful_update_url
    if params[:tab].present?
      [:admin, @contact, params[:tab].to_sym]
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
      :more_info_webchat,
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
      related_contact_ids: [],
    )
  end
end
