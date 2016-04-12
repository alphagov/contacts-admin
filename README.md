# Contacts app

This app publishes contact information for a given
organisation to GOV.UK.  It replaces the
[HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page) and although it works for any organisation, only HMRC currently use it.

## Live examples

This application serves the index/filtering page for contacts, for example:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact

Another application, [contacts-frontend](https://github.com/alphagov/contacts-frontend)
displays the contacts themselves, fetching them from content store:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact/alcohol-duties-national-registration-unit

## Technical documentation

This is a Ruby on Rails application that serves 2 purposes:

1. It provides the public index of an organisation's contacts to users.
2. It provides a private admin UI for signon users with permission to allow
   them to manage the contacts for their organisation.

The app has its own database (MySQL).  The frontend part of this app reads
contacts directly from this database.  This is in contrast to the separate [contacts-frontend](https://github.com/alphagov/contacts-frontend) app which reads contacts from the [content-store](https://github.com/alphagov/content-store).  The admin UI part of this app handles publishing the contacts to the [publishing-api](https://github.com/alphagov/publishing-api) and [rummager](https://github.com/alphagov/rummager) so that they are present for [contacts-frontend](https://github.com/alphagov/contacts-frontend) to read.

### Dependencies

* Ruby 2.1.4
* MySQL
* [Rummager](https://github.com/alphagov/rummager) - to publish contacts so
  they can be found by GOV.UK site search
* [Whitehall](https://github.com/alphagov/whitehall)
  1. to access the organisations API and maintain parity with the organisations
     managed in whitehall.
  2. to access the world locations API to provide the correct list of countries
     for the country dropdown in the address form
* [signon](https://github.com/alphagov/signonotron2) - for managing user auth in
  the admin part
* [static](https://github.com/alphagov/static) - for getting global GOV.UK
  templates for the public part
* [content-store](https://github.com/alphagov/content-store) - for doing some
  command-line based tasks to withdraw and redirect a contact

### Running the application

`./startup.sh`

This runs `bundle install` to install dependencies and runs the app on port `3051`.  When using the GOV.UK development VM it will be available at http://contacts-admin.dev.gov.uk/.  The public frontend lives at `/contact/hm-revenue-customs/` and the admin UI at `/admin`

By default, this application uses the GOV.UK preview environment for assets. To
run against a local version of static you need to set `STATIC_DEV` to
"http://static.dev.gov.uk".


### Running the test suite

`bundle exec rake`

The tests in this project rely upon [govuk-content-schemas](http://github.com/alphagov/govuk-content-schemas). By default these should be in the parent directory, otherwise you can specify their location with the `GOVUK_CONTENT_SCHEMAS_PATH` environment variable.

### Tasks

Rake tasks can be found in the standard location: `lib/tasks`.  The implementation of many of these can be found in `app/tasks` and `app/interactors` so they can also be run from the console.

### Database setup

The best way to get a database with good seed data is to use a dump from preview,
alternatively you can load the database schema and use the old initial seed data:

    ```
    bundle exec rake db:schema:load
    bundle exec rake db:seed
    bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
    ```

## Licence

[MIT License](LICENCE)
