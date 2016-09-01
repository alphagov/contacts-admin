require 'gds_api/content_store'
require 'publisher'

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
    elsif redirect_failed?
      Failure.new(:redirect_failed, contact.link, message: "PublishingApi Error: Redirect failed")
    else
      Success.new(contact.link)
    end
  end

  def contact_already_exists?
    Contact.exists?(contact_slug)
  end

  def contact_not_published?
    published_contact == :not_found
  end

  def contact_not_gone?
    published_contact != :gone
  end

  def redirect_failed?
    !redirect_contact_response
  end

  class Success
    attr_reader :full_contact_path
    def initialize(full_contact_path)
      @full_contact_path = full_contact_path
    end

    def successful?; true; end
  end

  class Failure
    attr_reader :full_contact_path, :reason, :existing, :message
    def initialize(reason, full_contact_path, existing: nil, message: nil)
      @reason = reason
      @existing = existing
      @message = message
      @full_contact_path = full_contact_path
    end

    def successful?; false; end
  end

  def redirect_content_item_content_id
    redirect_content_item_presenter.content_id
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
  rescue GdsApi::HTTPNotFound
    :not_found
  rescue GdsApi::HTTPGone
    :gone
  end

  def redirect_contact_response
    @redirect_contact_response ||= Publisher.publish(redirect_content_item_presenter)
  end

  def redirect_content_item_presenter
    @redirect_content_item ||= ContactRedirectPresenter.new(contact, redirect_to_location)
  end
end
