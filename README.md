# Contacts app

This app publishes contact information for a given organisation to GOV.UK. It replaces the [HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page) and although it works for any organisation, only HMRC currently uses it.

## Live examples

[finder-frontend](https://github.com/alphagov/finder-frontend) displays the index page for an organisation's contacts:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact

[contacts-frontend](https://github.com/alphagov/contacts-frontend)
displays the contacts themselves, fetching them from content store:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact/alcohol-duties-national-registration-unit

## Technical documentation

This is a Ruby on Rails application that provides a private admin UI for signon users with permission to allow them to manage the contacts for their organisation.

The app has its own database (MySQL), which is used by the admin UI. This is in contrast to the separate [contacts-frontend](https://github.com/alphagov/contacts-frontend) app which reads contacts from the [content-store](https://github.com/alphagov/content-store). The admin UI part of this app handles publishing the contacts to the [publishing-api](https://github.com/alphagov/publishing-api) and [rummager](https://github.com/alphagov/rummager) so that they are present for [finder-frontend](https://github.com/alphagov/finder-frontend) and [contacts-frontend](https://github.com/alphagov/contacts-frontend) to read.

### Dependencies

* Ruby 2.3.0
* MySQL
* [rummager](https://github.com/alphagov/rummager) - to publish contacts so
  they can be found by GOV.UK site search and [finder-frontend](https://github.com/alphagov/finder-frontend)
* [whitehall](https://github.com/alphagov/whitehall)
  1. to access the organisations API and maintain parity with the organisations managed in whitehall.
  2. to access the world locations API to provide the correct list of countries for the country dropdown in the address form
* [signon](https://github.com/alphagov/signonotron2) - for managing user authentication
* [content-store](https://github.com/alphagov/content-store) - for doing some
  command-line based tasks to withdraw and redirect a contact

### Running the application

`./startup.sh`

This runs `bundle install` to install dependencies and runs the app on port `3051`. When using the GOV.UK development VM it will be available at http://contacts-admin.dev.gov.uk/admin.

By default, this application uses the GOV.UK preview environment for assets. To run against a local version of static, you need to set `STATIC_DEV` to
"http://static.dev.gov.uk".

### Running the test suite

`bundle exec rake`

The tests in this project rely upon [govuk-content-schemas](http://github.com/alphagov/govuk-content-schemas). By default these should be in the parent directory, otherwise you can specify their location with the `GOVUK_CONTENT_SCHEMAS_PATH` environment variable.

### Tasks

Rake tasks can be found in the standard location: `lib/tasks`. The implementation of many of these can be found in `app/tasks` and `app/interactors` so they can also be run from the console.

### Database setup

The best way to get a database with good seed data is to use a dump from preview; alternatively you can load the database schema and use the old initial seed data:

```
bundle exec rake db:schema:load
bundle exec rake db:seed
bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
```

## Redirecting removed contacts

The Web UI of the app issues a “gone” item to the publishing api when a contact is deleted. Sometimes the correct thing to do is to issue a “redirect” instead. There is no web UI for this but there are two rake tasks to achieve this depending on the state of the contact to be redirected.

### For contacts that still exist

The rake task is `contacts:remove_with_redirect`, and is invoked as follows:
```
$ cd /var/apps/contacts
$ sudo -u deploy govuk_setenv contacts bundle exec rake contacts:remove_with_redirect[contact-to-remove-slug,path-to-redirect-to]
```

### For contacts that have been removed already

The rake task is `contacts:replace_gone_with_redirect`, and is invoked as follows:
```
$ cd /var/apps/contacts
$ sudo -u deploy govuk_setenv contacts bundle exec rake contacts:replace_gone_with_redirect[removed-contact-slug,organisation-slug,path-to-redirect-to]
```

This will fail if any of the following are true
1. `removed-contact-slug` references a contact object in the Contacts Admin database
2. the path constructed by `removed-contact-slug` and `organisation-slug` does not refer to a “gone” item in content store

## Licence

[MIT License](LICENCE)
