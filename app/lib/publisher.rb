class Publisher
  def self.publish(presenter)
    new(presenter).publish
  end

  attr_reader :presenter

  def initialize(presenter)
    @presenter = presenter
  end

  def publish
    send_item_to_draft_stack
    publish_links if presenter.links
    publish_item
    true
  rescue GdsApi::HTTPErrorResponse => e
    Airbrake.notify_or_ignore(e)
    false
  end

  def self.client
    Services.publishing_api
  end

private

  def send_item_to_draft_stack
    Publisher.client.put_content(presenter.content_id, presenter.payload)
  end

  def publish_links
    Publisher.client.patch_links(presenter.content_id, presenter.links)
  end

  def publish_item
    Publisher.client.publish(
      presenter.content_id, locale: presenter.payload[:locale]
    )
  end
end
