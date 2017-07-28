README

## Introduction
The purpose of Whatsit was to create a site for users to create their own wikis. The site has been monitized by adding features for premium users.  
Whatsit has standard, premium and admin roles.
Users are able upgrade to premiumn and pay a fee through stripe.
Premium accounts let users create private wikis.
All users can add wiki collaborators.
Wikis can be created using markup with Redcarpet.
Devise is used for authentication.
pics and comments, favorite and receive updates on comments via email.

## Live

https://whatsit.herokuapp.com/

Installation

-Ruby 2.1 -RoR 4.2.5

To get started with the app, clone the repo and then install the needed gems:

$ bundle install --without production Next, migrate the database:

$ rails db:migrate Finally, run the test suite to verify that everything is working correctly:

$ rails rspec If the test suite passes, you'll be ready to run the app in a local server:

$ rails server

Credit

Jeff Charlesworth
