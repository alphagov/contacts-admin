class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods
  include Slimmer::Headers
  include Slimmer::Template

  protect_from_forgery with: :exception

  after_filter :dev_skip_slimmer
  before_filter :set_slimmer_headers

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def dev_skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true" if params[:skip_slimmer]
  end

  def skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true"
  end

   def set_slimmer_headers
    response.headers[Slimmer::Headers::TEMPLATE_HEADER] = "header_footer_only"
  end


end
