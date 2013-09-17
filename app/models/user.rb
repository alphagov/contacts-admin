class User < ActiveRecord::Base
  include GDS::SSO::User

  serialize :permissions, Array

  validates :name, presence: true
  validates :email, presence: true

  #
  # GDS::SSO::User overwrites for Rails 4
  def self.find_for_gds_oauth(auth_hash)
    user_params = user_params_from_auth_hash(auth_hash)

    # update details of existing user
    if user = where(uid: auth_hash["uid"]).first
      user.update_attributes(user_params)
    else # Create a new user.
      create!(user_params)
    end
  end
end
