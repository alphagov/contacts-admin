class ContactsController < ApplicationController

  before_filter :set_beta_notice, only: :show

  expose(:search) {
    ContactsSearch.new search_params
  }

  expose(:contact_groups) {
    contact_group_ids = department.contacts.map do |contact|
      contact.contact_memberships.pluck(:contact_group_id)
    end.flatten.uniq
    ContactGroup.where(id: contact_group_ids).by_title  # select only contact_groups related to current department
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
    filter.merge(params.fetch(:search, {}))
  end

  def set_beta_notice
    response.header[Slimmer::Headers::BETA_LABEL] = "after:div#contact-details-header"
  end
end
