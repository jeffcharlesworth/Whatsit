# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

def create_user
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'topsecret'
  user.save!
end

def private_wiki
  Wiki.create!(title: Faker::RickAndMorty.location, body: Faker::RickAndMorty.quote, private: true, user_id: rand(1..50))

end

def public_wiki
  Wiki.create!(title: Faker::RickAndMorty.location, body: Faker::RickAndMorty.quote, private: false, user_id: rand(1..50))
end

50.times do create_user end
50.times do private_wiki end
50.times do public_wiki end
