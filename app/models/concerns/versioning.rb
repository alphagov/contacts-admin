module Versioning
  extend ActiveSupport::Concern
  included do
    has_paper_trail ignore: %i[updated_at created_at]
  end

  def display_versions
    versions.order(created_at: :desc)
  end
end
