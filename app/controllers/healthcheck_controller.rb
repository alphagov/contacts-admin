class HealthcheckController < ActionController::Base
  def check
    Department.all # check DB connectivity
    render json: { git_sha1: CURRENT_RELEASE_SHA }
  end
end
