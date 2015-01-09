class AdminController < ApplicationController
  layout "admin"

  # Don't serve admin assets from the CDN
  # Respond.js needs to run on the same domain to request stylesheets,
  # parse them and render a non-mobile layout on <IE9
  # https://github.com/scottjehl/Respond#cdnx-domain-setup
  ActionController::Base.asset_host = nil

  prepend_before_filter :authenticate_user!
  before_filter :require_signin_permission!
  before_filter :skip_slimmer

  def info_for_paper_trail
    { user_name: current_user.name }
  end

private

  def load_parent_contact
    @contact = Contact.find(params[:contact_id])
  end
end
