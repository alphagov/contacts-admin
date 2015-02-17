module RegisterParent
  extend ActiveSupport::Concern
  included do
    after_save :register_parent
  end

  def register_parent
    presenter = ContactPresenter.new(self.contact)
    ::Contacts.publishing_api.put_content_item(contact.link, presenter.present)
  end
end
