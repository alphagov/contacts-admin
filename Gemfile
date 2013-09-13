# Error on CI with simple_form gem install
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

puts "RUBY_VERSION: #{RUBY_VERSION}"

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

gem 'gds-sso', github: 'alphagov/gds-sso', branch: 'master', ref: 'bf4b6d13a1'
gem 'gds-api-adapters'
gem 'rummageable', github: 'alphagov/rummageable', branch: 'master'
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
  gem 'rack-mini-profiler'
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
  gem "simplecov"
  gem "simplecov-rcov"
end
