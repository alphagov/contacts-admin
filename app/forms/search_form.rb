class SearchForm
  include Virtus
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Search query
  attribute :q, String

  def persisted?
    false
  end
end
