class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods
  include Slimmer::Headers
  include Slimmer::Template

  protect_from_forgery with: :exception

  after_filter :dev_skip_slimmer

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def dev_skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true" if params[:skip_slimmer]
  end

  def skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true"
  end

end
