class WorldLocation
  def self.all
    data = Rails.cache.fetch("all", expires_in: 1.day) do
      Services.worldwide_api.world_locations.with_subsequent_pages.to_a
    end

    data
      .select { |l| l["format"] == "World location" && l.dig("details", "slug").present? }
      .map { |location_data| new(location_data) }
  end

  def self.find(location_slug)
    data = Rails.cache.fetch("find_#{location_slug}", expires_in: 1.day) do
      Services
        .worldwide_api
        .world_location(location_slug)
        .parsed_content
    end

    new(data)
  end

  def initialize(data)
    @data = data
  end

  def ==(other)
    other.is_a?(self.class) && other.slug == slug
  end

  def slug
    @data["details"]["slug"]
  end

  def title
    @data["title"]
  end
end
