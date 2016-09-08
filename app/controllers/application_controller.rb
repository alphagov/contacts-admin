class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods
  include Slimmer::Headers
  include Slimmer::Template

  slimmer_template 'header_footer_only'

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit
  after_filter :dev_skip_slimmer

  def dev_skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true" if params[:skip_slimmer]
  end

  def skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true"
  end
end
