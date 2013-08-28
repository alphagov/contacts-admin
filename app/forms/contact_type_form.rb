class ContactTypeForm
  include Virtus
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attribute :contact_type_id

  def persisted?
    false
  end
end
