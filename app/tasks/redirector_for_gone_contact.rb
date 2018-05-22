class RedirectorForGoneContact
  def initialize(gone_content_id:, redirect_to_location:)
    @gone_content_id = gone_content_id
    @redirect_to_location = redirect_to_location
  end

  def redirect_gone_contact
    Services.publishing_api.unpublish(
      @gone_content_id,
      type: 'redirect',
      alternative_path: @redirect_to_location
    )
  end
end
