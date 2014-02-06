source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

gem 'rails', '4.0.2'

gem 'active_hash', '~> 1.2.0'
gem 'bootstrap-sass', '2.3.2.2'
gem 'decent_decoration', '~> 0.0.5'
gem 'decent_exposure', '~> 2.3.0'
gem 'draper', '~> 1.2.1'
gem 'mysql2', '~> 0.3.13'
gem 'simple_form', '~> 3.0.0', github: 'plataformatec/simple_form'
gem 'slimmer', '~> 3.20.0'
gem 'friendly_id', '5.0.2'
gem 'unicorn', '~> 4.6.3'
gem 'virtus', '~> 1.0.0.beta8'
gem 'paper_trail', '>= 3.0.0.beta1'
gem "govspeak", "1.2.3"
gem 'gds-sso', github: "alphagov/gds-sso", branch: "master", ref: "b3e2c05"
gem 'gds-api-adapters', '~> 7.20.0'
gem 'lrucache', '0.1.4'
gem 'rummageable', github: 'alphagov/rummageable', branch: 'master'
gem 'plek', '>= 1.0.0'

gem 'aws-ses', require: 'aws/ses' # Needed by exception_notification
gem 'exception_notification'

gem 'whenever', '~> 0.8.4'

gem 'searchlight'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'govuk_frontend_toolkit', '0.34.0'
gem 'jquery-rails'

# development
group :development do
  gem 'capistrano'
  gem 'railroady'
  gem 'rack-mini-profiler', '~> 0.1.31'
end

group :development, :test do
  gem 'pry-rails'
end

# testing

group :test do
  gem 'ci_reporter'
  gem 'rspec-rails', '~> 2.14'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'fakefs', require: 'fakefs/safe'
  gem 'capybara'
  gem 'simplecov'
  gem 'simplecov-rcov'
end
