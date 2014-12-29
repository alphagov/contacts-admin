# Contacts app

This is a beta for an app to publish contact information for a given
organisation to GOV.UK. In the first instance, it is replacing the
[HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page).

## Live examples

This application serves the index/filtering page for contacts, for example:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact

Another application, [contacts-frontend](https://github.com/alphagov/contacts-frontend)
displays the contacts themselves, fetching them from content store:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact/alcohol-duties-national-registration-unit

## Dependencies

* Ruby 2.1.4
* MySQL
* Rummager (for GOV.UK site search)

## Database setup

The best way to get a database with good seed data is to use a dump from preview,
alternatively you can load the database schema and use the old initial seed data:

    ```
    bundle exec rake db:schema:load
    bundle exec rake db:seed
    bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
    ```

## Running

Start the application with `./startup.sh` or use bowler.

Set RUMMAGER_API=true and WHITEHALL_API=true to enable API requests in development

open http://contacts.dev.gov.uk/contact/hm-revenue-customs/
open http://contacts.dev.gov.uk/admin

By default, this application uses the GOV.UK preview environment for assets. To
run against a local version of static you need to set `STATIC_DEV` to
"http://static.dev.gov.uk".

## Including Contacts in GOV.UK site search

You can manually add contacts to the GOV.UK search index with a rake task:

    ````
    bundle exec rake contacts:index

    ````

This rake task only indexes contacts with a need ID. There are currently no
contacts with need IDs and there is no user interface to do so.


## Development notes

* ```app/tasks``` - contains one-off tasks that can be run via console or a rake task.

## Tests

    ```
    bundle exec rake db:test:prepare RAILS_ENV=test
    bundle exec rspec .
    ```
