# Currency Conversion Application

It is an application to show currency conversion rates in real time using fixer.io

- Requirements

  * ruby 3.1.1
  * Rails 7.0.4
  
- Install GEM dependencies:

  ```bash
  bundle install
  ```
  
- Create database, migrate tables and run the seed data:

  ```bash
  rake db:create
  rake db:migrate
  rake db:seed
  ```
- Install Redis

  ```bash
  brew install redis
  ```

- Update cronjob with the environment  
  
  ```bash
  whenever --update-crontab --set environment='development'
  ```

- fixer.io API KEY
  * There is an api key defined in the seeds.rb, but for a new one, the api key must be entered in the settings.
