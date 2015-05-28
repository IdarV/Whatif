# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create([
                    {total_taken: 0, yes: 0, no: 0, whatif: 'something', but: 'somethingelse'},
                    {total_taken: 0, yes: 0, no: 0, whatif: 'you became a toad', but: 'a princess would kiss you 5 years later'},
                    {total_taken: 0, yes: 0, no: 0, whatif: 'you could save the world from a meteorite', but: 'you died in the process'},
                    {total_taken: 0, yes: 0, no: 0, whatif: 'you got the newest tech the rest of your life', but: 'were stuck in a 5km city with no nature for the rest of your life'},
                    {total_taken: 0, yes: 0, no: 0, whatif: 'you got to spend monopoly money as real money', but: 'you had to play monopoly sober and serious with 8 boring old guys for 8 hours a day'},])


User.create(name: 'Vidar', email: 'twintip_idar@hotmail.com', encrypted_password:'$2a$08$fnkgjXgyHhesdiDcWK4sXezHnfz/6hAM.dQyiQLklvipRCNFiTVYW', sign_in_count:'0',
            created_at: '2015-05-26 11:30:00', answered: 0, common:0, picture: 'http://th04.deviantart.net/fs70/PRE/i/2012/218/c/0/buckethead_by_stonedsour887-d4w3x92.jpg')