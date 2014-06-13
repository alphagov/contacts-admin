class ContactsController < ApplicationController
  before_filter :set_beta_notice, only: :show
  helper_method :organisation, :search, :contact_groups

  def index
    @contacts = search.results.includes(:contact_groups).for_listing
  end

  def show
    @contact = organisation.contacts.find(params[:id])
  end

  private

  def search_params
    filter = { organisation_id: organisation.id }
    filter.merge(params.fetch(:search, {}))
  end

  def set_beta_notice
    response.header[Slimmer::Headers::BETA_LABEL] = "after:.header-block"
  end

  def organisation
    @organisation ||= Organisation.find_by_slug(params[:organisation_slug])
  end

  def search
    @search ||= ContactsSearch.new search_params
  end

  def contact_groups
    @contact_groups ||= organisation.contact_groups.by_title
  end
end