#!/bin/bash -x

set -e

export RAILS_ENV=test
bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment
bundle exec rake db:drop db:create db:schema:load
bundle exec rake assets:precompile --trace

# Clone govuk-content-schemas depedency for contract tests
rm -rf tmp/govuk-content-schemas
git clone git@github.com:alphagov/govuk-content-schemas.git tmp/govuk-content-schemas

GOVUK_CONTENT_SCHEMAS_PATH=tmp/govuk-content-schemas COVERAGE=on bundle exec rake ci:setup:rspec spec --trace

bundle exec govuk-lint-ruby app lib spec
