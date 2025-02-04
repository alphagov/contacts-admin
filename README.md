# Contacts app (DEPRECATED)

> **NOTE**: This project is deprecated and is planned to be consolidated into Specialist Publisher in early 2025.

---

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

### Further documentation

Check the [docs/](docs/) directory.

## Licence

[MIT License](LICENCE)
