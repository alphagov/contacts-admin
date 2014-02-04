class ContactsController < ApplicationController
  expose(:search) {
    ContactsSearch.new search_params
  }

  expose(:contact_groups) {
    contact_group_ids = department.contacts.map do |contact|
      contact.contact_memberships.pluck(:contact_group_id)
    end.flatten.uniq
    ContactGroup.where id: contact_group_ids  # select only contact_groups related to current department
  }

  expose(:department) {
    Department.find_by!(slug: params[:department_id])
  }

  expose(:contact) {
    department.contacts.find_by!(slug: params[:id]).decorate
  }

  expose(:contacts) {
    search.results.for_listing.decorate
  }

  def index
  end

  def show
  end

  private

  def search_params
    filter = { department_id: params[:department_id] }
    filter.merge params.fetch(:search, {})
  end
end
