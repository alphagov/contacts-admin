source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

gem 'rails', '4.0.0'

gem 'active_hash'
gem 'bootstrap-sass'
gem 'decent_decoration'
gem 'decent_exposure'
gem 'draper'
gem 'mysql2'
gem 'redcarpet'
gem 'simple_form', github: 'plataformatec/simple_form', ref: '359606f'
gem 'slimmer', '>= 3.0.0'
gem 'stringex'
gem 'unicorn', '~> 4.6.3'
gem 'virtus'
gem 'ariane'

gem 'gds-sso', github: 'alphagov/gds-sso', branch: 'master', ref: 'bf4b6d13a1'
gem 'gds-api-adapters'
gem 'plek', '>= 1.0.0'

gem 'aws-ses', require: 'aws/ses' # Needed by exception_notification
gem 'exception_notification'

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
end
