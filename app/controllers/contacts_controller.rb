class ContactsController < ApplicationController
  expose(:search) {
    ContactsSearch.new params[:search]
  }

  expose(:department) {
    Department.find_by!(slug: params[:department_id])
  }

  expose(:contact) {
    department.contacts.find_by!(slug: params[:id]).decorate
  }

  expose(:contacts) {
    if search.name.blank?
      department.
      contacts.
      for_listing.
      decorate
    else
      search.results
    end
  }

  def index
  end

  def show
  end
end
