class ContactsController < ApplicationController
  expose_decorated :contact, finder: :find_by_slug, collection: false
  # expose(:contact)

  def show
  end

  def information_you_will_need
  end

  def contact_details
  end
end
