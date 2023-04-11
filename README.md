# README

Installation instructions:

* Ruby version

3.0.0

* System dependencies

	- RVM or other ruby version manager of your choice
	- Rubygems
	- Native MySQL

* Installation instructions

In the project directory, install ruby version if not installed, e.g.

	rvm install 3.0.0

Install bundler
	
	gem install bundler

Install required gems

	bundle

Create your `database.yml` file
	
	cp database.yml.example database.yml

Update `database.yml` to match your local mysql settings

Create and initialize database

	rake db:create
	rake db:migrate
	rake db:seed

*Optional* Run the test suite to ensure that the project is set up correctly

	rspec

*Optional* Run the static code analyzer

	rubocop

Run the server

	rails s

Open `http://127.0.0.1:3000/graphiql` for a GraphQL visual explorer or use Postman with attached collection (`graphql_challenge.postman_collection.json`)
