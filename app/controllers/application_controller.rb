class ApplicationController < ActionController::Base
  include Slimmer::Headers
  include Slimmer::Template

  protect_from_forgery with: :exception

  def skip_slimmer
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true"
  end
end
