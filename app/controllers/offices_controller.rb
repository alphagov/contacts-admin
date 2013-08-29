class OfficesController < ApplicationController
  expose_decorated :office, finder: :find_by_slug
  expose(:contact) { office.contact }

  def show
  end

  def information_you_will_need
  end

  def contact_details
  end
end
