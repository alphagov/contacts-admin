GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = ENV['OAUTH_ID'] || "abcdefghjasndjkasndcontacts"
  config.oauth_secret = ENV['OAUTH_SECRET'] || "secret"
  config.oauth_root_url = Plek.new.find("signon")
end
