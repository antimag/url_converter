# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version 2.2.6

* Rails version 5.0.6

* Database creation using  "rake db:create:all"

* Run migrations using "rake db:migrate"

* Run "rake db:test:prepare"

* Then start rails server using "rails s"

* Endpoint for redirect shortred url to original one if request headers contains "X-Api-Key" i.e. created by user OR you can also pass api_key parameter in shorted url 

* Get request like this: http://localhost:3000/ee92b34b08376e2fe0d510?api_key=87a215319b682b24667b7656a754c811

* Endpoint for create user and generate api_key for that user
* Post request: "/generate_key?email=jabba1@mailinator.com&name=jabba"

* Endpoint for convert URL to short_url
* Post request: "/create_short_url?given_url=https://stackoverflow.com/"

* Response will be like this:

{
    "id": 12,
    "given_url": "https://stackoverflow.com/",
    "short_url": "7550ed16d6040465f88512",
    "user_id": 1,
    "created_at": "2018-03-11T16:28:42.031Z",
    "updated_at": "2018-03-11T16:28:42.031Z",
    "converted_url": "http://localhost:3000/7550ed16d6040465f88512"
}

* Run specs "rspec spec"