class ContactsController < ApplicationController

  before_filter :set_beta_notice, only: :show

  expose(:search) {
    ContactsSearch.new search_params
  }

  expose(:contact_groups) {
    contact_group_ids = organisation.contacts.map do |contact|
      contact.contact_memberships.pluck(:contact_group_id)
    end.flatten.uniq
    ContactGroup.where(id: contact_group_ids).by_title  # select only contact_groups related to current department
  }

  expose(:organisation) {
    Organisation.find_by_slug(params[:organisation_slug])
  }

  expose(:contact) {
    organisation.contacts.find(params[:id]).decorate
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
    filter = { organisation: params[:organisation] }
    filter.merge(params.fetch(:search, {}))
  end

  def set_beta_notice
    response.header[Slimmer::Headers::BETA_LABEL] = "after:.header-block"
  end
end
