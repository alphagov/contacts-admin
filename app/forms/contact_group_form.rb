class ContactGroupForm
  include Virtus.model
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attribute :contact_group_id

  def persisted?
    false
  end
end
