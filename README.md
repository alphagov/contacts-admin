# Contacts app

This is an alpha for the replacement of the existing
[HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page)
to facilitate the HMRC transition to GOV.UK.

The aim is to build an application which can surface many contact methods for a
department or agency with deflection into relevant content, and grouping of contacts.

The use case would be to populate the application with HMRC contact data, and the
relevant links to content. Having one place for this information will reduce the burden
on editors to keep all the contact details up to date on disparate pieces of content,
and we plan to have a contacts lookup API similar to the one Whitehall has to allow easy
linking to contact details within content.

## Dependencies

* Ruby 2.0.0-p353
* MySQL
* Rummager (for indexing)
* Whitehall (for departments API)

## Database setup

The best way to get a database with good seed data is to use a dump from preview, 
alternatively you can load the database schema and use the old initial seed data.

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

## Indexing the data

Only contacts with a need id will be indexed, need ids will need to be added via 
a database migration. 

    ````
    Ensure rummager is running
    bundle exec rake contacts:index

    ````

To run against a local version of static you need to set `STATIC_DEV` to "http://static.dev.gov.uk".

## Development notes

* ```app/tasks``` - contains one-off tasks that can be run via console or a rake task.

## Tests

    ```
    bundle exec rake db:migrate RAILS_ENV=test
    bundle exec rspec .
    ```