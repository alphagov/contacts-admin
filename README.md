# Contacts app

This is an alpha for the replacement of the existing
[HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page)
to facilitate the HMRC transition to GOV.UK.

The aim is to build an application which can surface many contact methods for a
department or agency with deflection into relevant content, and grouping contacts by
topic or questions.

The use case would be to populate the application with HMRC contact data, and the
relevant links to content. Having one place for this information will reduce the burden
on editors to keep all the contact details up to date on disparate pieces of content,
and we plan to have a contacts lookup API similar to the one Whitehall has to allow easy
linking to contact details within content.

The contacts functionality in Whitehall may be split out into this application if the
needs of other departments overlap with HMRC.

## Dependencies

* Ruby 1.9.3 or higher
* MySQL
* Rummager

## Setup

* Install necessary dependencies
* Start the app

## Running

1. Load database structure & seed data

    ```
    bundle exec rake db:schema:load
    bundle exec rake db:seed
    bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
    ```

2. Start the application

   ````
   ./startup.sh
   ````

3. Indexing the data

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