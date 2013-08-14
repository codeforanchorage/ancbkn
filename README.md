ancbkn
======

Prerequisites
-------------

* Ruby 2.0
* Rails 4.0
* Postgresql

Application setup
-----------------

Clone the repository:

    git clone git@github.com:codeforanchorage/ancbkn.git

Install dependencies:

    bundle install

Create new Postgres login role:

    user: ancbkn
    password: allofthedata
    
Create local databases:

    rake db:create:all
    
Run database migration:

    rake db:migrate
