# Contacts app

This app publishes contact information for a given organisation to GOV.UK. It replaces the [HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page) and although it works for any organisation, only HMRC currently uses it.

## Live examples

[finder-frontend](https://github.com/alphagov/finder-frontend) displays the index page for an organisation's contacts:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact

[government-frontend](https://github.com/alphagov/government-frontend)
displays the contacts themselves, fetching them from content store:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact/alcohol-duties-national-registration-unit

## Technical documentation

This is a Ruby on Rails app, and should follow [our Rails app conventions](https://docs.publishing.service.gov.uk/manual/conventions-for-rails-applications.html).

You can use the [GOV.UK Docker environment](https://github.com/alphagov/govuk-docker) to run the application and its tests with all the necessary dependencies. Follow [the usage instructions](https://github.com/alphagov/govuk-docker#usage) to get started.

**Use GOV.UK Docker to run any commands that follow.**

### Before running the app

The best way to get a database with good seed data is to replicate from Integration. Alternatively, you can use a combination of import commands and old seed data to seed the database, as follows:

```sh
env GOVUK_APP_DOMAIN='https://www.gov.uk' GOVUK_WEBSITE_ROOT='https://www.gov.uk' bin/rake db:seed
bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
```

Contacts Admin imports from Whitehall's organisations API (as the source of truth for organisations); and its world locations API (to provide the list of countries for the dropdown in the address form).

### Running the test suite

```sh
bundle exec rspec
```

## Redirecting contacts that have been removed already

Contacts Admin used to issue a “gone” item to Publishing API when a contact was deleted. But since [#838](https://github.com/alphagov/contacts-admin/pull/838), we issue a “redirect” instead.

If a contact was removed as a “gone” item and now needs to be redirected, we have a Rake task for this:

```
$ cd /var/apps/contacts
$ sudo -u deploy govuk_setenv contacts bundle exec rake contacts:replace_gone_with_redirect[removed-contact-slug,organisation-slug,path-to-redirect-to]
```

This will fail if either of the following are true:

1. `removed-contact-slug` references a contact object in the Contacts Admin database
2. the path constructed by `removed-contact-slug` and `organisation-slug` does not refer to a “gone” item in content store

## Licence

[MIT License](LICENCE)
