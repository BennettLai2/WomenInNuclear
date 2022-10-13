# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.2

* System dependencies

* Configuration

* Database creation and Initialization
    * To create the database, run the following command: rails db:create
        The following databases are created:
        - Accounts: (first_name: string, last_name: string, email: string, password_digest: string, points: integer, admin: boolean)
        - Events: (meeting_id: integer, points: integer, meeting_name: string, start_time: datetime, end_time: datetime, description: string)

    * To migrate the databases, run the following command: rails db:migrate

* How to run the test suite
    * To run the test suite run the following commands:
        - rspec spec/feature/integration_spec.rb: Integration tests
        - SimpleCov.start: Testing code coverage
        - brakeman: (maybe add this later by adding to gem file)
        - rubocop: Test for formatting errors in certain directory (linter)

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
