require 'gds_api/content_store'

class RedirectorForGoneContact

  def initialize(contact_slug:, organisation_slug:, redirect_to_location:)
    @contact_slug = contact_slug
    @organisation_slug = organisation_slug
    @redirect_to_location = redirect_to_location
  end

  def redirect_gone_contact
    if contact_already_exists?
      Failure.new(:contact_exists, contact.link)
    elsif contact_not_published?
      Failure.new(:unpublished_contact, contact.link)
    elsif contact_not_gone?
      Failure.new(:not_gone, contact.link, existing: published_contact)
    elsif contact_not_published_by_contacts?
      Failure.new(:not_published_by_contacts, contact.link, existing: published_contact)
    elsif redirect_failed?
      Failure.new(:redirect_failed, contact.link, error: redirect_contact_response)
    else
      Success.new(contact.link)
    end
  rescue GdsApi::HTTPErrorResponse => e
    Failure.new(:redirect_failed, contact.link, error: e)
  end

  def contact_already_exists?
    Contact.exists?(contact_slug)
  end

  def contact_not_published?
    published_contact.nil?
  end

  def contact_not_gone?
    published_contact.format != 'gone'
  end

  def contact_not_published_by_contacts?
    published_contact.publishing_app != 'contacts'
  end

  def redirect_failed?
    redirect_contact_response.code != 200
  end

  class Success
    attr_reader :full_contact_path
    def initialize(full_contact_path)
      @full_contact_path = full_contact_path
    end

    def successful?; true; end
  end

  class Failure
    attr_reader :full_contact_path, :reason, :existing, :error
    def initialize(reason, full_contact_path, existing: nil, error: nil)
      @reason = reason
      @existing = existing
      @error = error
      @full_contact_path = full_contact_path
    end
    def successful?; false; end
  end

private
  attr_reader :contact_slug, :organisation_slug, :redirect_to_location

  def content_store
    GdsApi::ContentStore.new(Plek.current.find('content-store'))
  end

  def organisation
    @organisation ||= Organisation.find(organisation_slug)
  end

  def contact
    @contact ||= Contact.new(slug: contact_slug, organisation: organisation)
  end

  def published_contact
    @published_contact ||= content_store.content_item(contact.link)
  end

  def redirect_contact_response
    @redirect_contact_response ||= ::Contacts.publishing_api.put_content_item(contact.link, redirect_content_item)
  end

  def redirect_content_item
    @redirect_content_item ||= ContactRedirectPresenter.new(contact, redirect_to_location).present
  end

end
