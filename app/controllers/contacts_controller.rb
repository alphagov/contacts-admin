class ContactsController < ApplicationController

  before_filter :set_beta_notice, only: :show

  expose(:search) {
    ContactsSearch.new search_params
  }

  expose(:contact_groups) {
    organisation.contact_groups.by_title
  }

  expose(:organisation) {
    Organisation.find_by_slug(params[:organisation_slug])
  }

  expose(:contact) {
    organisation.contacts.find(params[:id]).decorate
  }

  expose(:contacts) {
    search.results.includes(:contact_groups).for_listing.decorate
  }

  def index
  end

  def show
  end

  private

  def search_params
    filter = { organisation_id: organisation.id }
    filter.merge(params.fetch(:search, {}))
  end

  def set_beta_notice
    response.header[Slimmer::Headers::BETA_LABEL] = "after:.header-block"
  end
end
