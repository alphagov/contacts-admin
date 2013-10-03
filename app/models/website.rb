class Website < ActiveRecord::Base
  include Versioning

  validates :title, presence: true
  validates :link, presence: true
end
