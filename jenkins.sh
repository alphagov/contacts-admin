#!/bin/bash -x

set -e

export RAILS_ENV=test
bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment
bundle exec rake db:drop db:create db:schema:load
bundle exec rake assets:precompile --trace
bundle exec rake ci:setup:rspec spec --trace

