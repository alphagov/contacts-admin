class User < ActiveRecord::Base
  include GDS::SSO::User

  serialize :permissions, Array

  validates :name, presence: true
  validates :email, presence: true
end
