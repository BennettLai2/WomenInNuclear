# README

* Ruby version: 3.0.2

* To Run Locally:
    * bundle install
    * rails db:create
    * rails db:migrate
    * rails server --binding=0.0.0.0

* System dependencies
    * All dependecies are listed in the Gemfile
    * Use bundle install to install dependencies

* Configuration:
    * Docker (with ruby on rails and postgressql)

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
        - brakeman: Security
        - rubocop: Test for formatting errors in certain directory (linter)

* Services (job queues, cache servers, search engines, etc.)
    * Can add members, update points (attend meetings), check current points of members,
    search members, create meetings, check milestones reached (and create milestones),
    sort members in a leaderboard, make members admins, reset points, and view events

* Deployment instructions
    * The application is deployed in Heroku. When code is pushed to main, the Heroku
    link is automatically updated.

* Added Ruby Gems:
-bcrypt
-validate_timeliness
* ...
