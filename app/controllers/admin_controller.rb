class AdminController < ApplicationController
  layout 'admin'

  prepend_before_filter :authenticate_user!
  before_filter :require_signin_permission!
  before_filter :skip_slimmer

  def info_for_paper_trail
    { user_name: current_user.name }
  end
end
