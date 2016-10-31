class AdminController < ApplicationController
  layout "admin"

  prepend_before_filter :authenticate_user!
  before_filter :require_signin_permission!

  def info_for_paper_trail
    { user_name: current_user.name }
  end

private

  def load_parent_contact
    @contact = Contact.find(params[:contact_id])
  end
end
