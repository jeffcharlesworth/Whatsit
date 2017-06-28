README

## Introduction
This was a self directed project and my second rails app, no code copied, no samples provided. The purpose of blocipedia was to create a functioning wiki site. 
Blocipedia has standard, premium and admin roles. 
Users are able upgrade to premiumn and pay a fee through stripe. 
Premium accounts let users create private wikis.
All users can add wiki collaborators. 
Wikis can be created using markup with Redcarpet.
Devise is used for authentication.
pics and comments, favorite and receive updates on comments via email.

## Live

https://blocipedia-jc.herokuapp.com/

Installation

-Ruby 2.1 -RoR 4.2.5

To get started with the app, clone the repo and then install the needed gems:

$ bundle install --without production Next, migrate the database:

$ rails db:migrate Finally, run the test suite to verify that everything is working correctly:

$ rails rspec If the test suite passes, you'll be ready to run the app in a local server:

$ rails server

Credit

Jeff Charlesworth
