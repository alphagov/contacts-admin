class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit
end
