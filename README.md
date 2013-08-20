# HMRC Contacts app

## Dependencies

* Ruby 1.9.3 or higher
* MySQL

## Setup

* Install necessary dependencies
* Start the app

## Running

1. Load database structure

    ```
    bundle exec rake db:schema:load
    bundle exec rake db:seed
    ```

2. Start the application

   ````
   ./startup.sh
   ````

## Development notes

* ```app/tasks``` - contains one-off tasks that can be run via console or a rake task.
