ancbkn
======

Prerequisites
-------------

* Ruby 2.0
* Rails 4.0
* Postgresql


Postgres Configuration
----------------------

Once prerequisites are installed, local test and development databases should be configured.

Create test and development databases either via pgAdmin or through psql from the terminal.

    Development: ancbkn_development
    Test: ancbkn_test

    New login role: ancbkn
    Password: allofthedata

App setup
---------

Clone the repository:

    git clone git@github.com:codeforanchorage/ancbkn.git

Install dependencies:

    bundle install

Run database migration:

    rake db:migrate
