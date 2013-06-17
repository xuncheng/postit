# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

user = User.create(username: "xuncheng", email: "w.xun.cheng@gmail.com", 
                  password: "foobar", password_confirmation: "foobar")

categories = Category.create([{name: "Programming"}, {name: "Current Event"}, {name: "Sports"}, 
                              {name: "Funny"}, {name: "Blackjack"}])

