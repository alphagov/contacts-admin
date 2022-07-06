ARG base_image=ruby:3.0.4

FROM $base_image AS builder

ENV RAILS_ENV=production
# TODO: have a separate build image which already contains the build-only deps.
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y build-essential nodejs && \
    apt-get clean

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock .ruby-version /app/

RUN bundle config set deployment 'true' && \
    bundle config set without 'development test' && \
    bundle install --jobs 4 --retry=2

COPY . /app
# TODO: We probably don't want assets in the image; remove this once we have a proper deployment process which uploads to (e.g.) S3.
RUN GOVUK_APP_DOMAIN=www.gov.uk \
    GOVUK_WEBSITE_ROOT=https://www.gov.uk \
    bundle exec rails assets:precompile

FROM $base_image

ENV RAILS_ENV=production GOVUK_APP_NAME=contacts-admin GOVUK_APP_DOMAIN=www.gov.uk GOVUK_WEBSITE_ROOT=https://www.gov.uk PORT=3051 DATABASE_URL=mysql2://root:root@mysql/contacts-admin

RUN apt-get update -qy && \
    apt-get upgrade -y && \
    apt-get install -y nodejs && \
    apt-get clean

WORKDIR /app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /app ./

CMD GOVUK_PROMETHEUS_EXPORTER=true bundle exec puma
