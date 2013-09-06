class ContactsController < ApplicationController
  expose(:department) {
    Department.find_by_slug!(params[:department_id])
  }
  expose(:contact) {
    department.contacts.find_by_slug!(params[:id]).decorate
  }

  def show
  end

  def information_you_will_need
  end

  def contact_details
  end
end
