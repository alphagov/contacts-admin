FROM ruby:2.4.2
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y build-essential nodejs && apt-get clean

ENV DATABASE_URL mysql2://root:root@mysql/contacts-admin
ENV GOVUK_APP_NAME contacts-admin
ENV PORT 3051
ENV RAILS_ENV development

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* .ruby-version $APP_HOME/
RUN bundle install
ADD . $APP_HOME

RUN GOVUK_APP_DOMAIN=www.gov.uk RAILS_ENV=production bundle exec rails assets:precompile

HEALTHCHECK CMD curl --silent --fail localhost:$PORT/healthcheck || exit 1

CMD bash -c "bundle exec unicorn -p $PORT"
