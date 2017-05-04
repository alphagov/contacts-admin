class Website < ApplicationRecord
  include Versioning

  validates :title, presence: true
  validates :link, presence: true
end
