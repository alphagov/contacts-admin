source 'https://rubygems.org'
source "https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/"

gem 'rails', '4.0.0'

gem 'active_hash'
gem 'bootstrap-sass'
gem 'mysql2'
gem 'unicorn', "~> 4.6.3"

gem 'gds-sso', github: "alphagov/gds-sso", branch: "master", ref: "bf4b6d13a1"
gem "plek", ">= 1.0.0"

gem 'aws-ses', require: 'aws/ses' # Needed by exception_notification
gem 'exception_notification'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

# development
group :development do
  gem 'capistrano'
end

group :development, :test do
  gem 'pry-rails'
end

# testing

group :test do
  gem "ci_reporter"
  gem 'rspec-rails', '~> 2.14'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'fakefs', require: "fakefs/safe"
end
