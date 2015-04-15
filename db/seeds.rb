# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(total_taken: 0, yes: 0, no: 0, whatif: 'something', but: 'somethingelse')


User.create(name: 'Vidar', answered: 0, common:0.0, picture: 'http://th04.deviantart.net/fs70/PRE/i/2012/218/c/0/buckethead_by_stonedsour887-d4w3x92.jpg')