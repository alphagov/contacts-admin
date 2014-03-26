class HealthcheckController < ActionController::Base
  def check
    Contact.first # check DB connectivity
    render json: { git_sha1: CURRENT_RELEASE_SHA }
  end
end
