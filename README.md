# Currency Conversion Application

It is an application to show currency conversion rates in real time using fixer.io

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

- Update cronjob with the environment  
  
  ```bash
  whenever --update-crontab --set environment='development'
  ```
