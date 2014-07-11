GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = ENV['HMRC_CONTACTS_OAUTH_ID'] || "abcdefghjasndjkasndcontacts"
  config.oauth_secret = ENV['HMRC_CONTACTS_OAUTH_SECRET'] || "secret"
  config.oauth_root_url = Plek.current.find("signon")
end
