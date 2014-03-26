Contacts::Application.configure do
  config.slimmer.logger = Rails.logger

  if Rails.env.production?
    config.slimmer.use_cache = true
  end

  if Rails.env.development?
    config.slimmer.asset_host = if ENV["STATIC_DEV"]
      Plek.current.find('static')
    else
      "https://static.preview.alphagov.co.uk"
    end
  end
end
