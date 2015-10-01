# THIS IS A SCHOOL PROJECT, AND I DIDN'T REALLY KNOW WHAT I WAS DOING

# Whatif...
### Whatif is a game where your morals will be conflicted by your ego and self esteem

# Info
## Install and run
### To install and run locally (given you already have RoR setup), run the following commands:
> \> git clone https://github.com/IdarV/Whatif.git

> \> cd /Whatif

> \> bundle install

> \> rake db:migrate

> \> rake db:seed

> \> rails server

## Mailing
### Set up your own mailing service
> \> figaro install

> \# creates /config/application.yml and gitignores it

> \# add **mandrill\_mail** and **mandrill\_psw** with your mailservice credentials to /config/application.yml

>> *example:*

>> mandrill_mail: me@mymailservice.com

>> mandrill_psw: myp4ssw0rd_0r_T0ken


 Mail should now be sendable from your mailer

## Tests:
#### Run:
> \> rake db:migrate RAILS_ENV=test

> \> rake test

There should now be a folder /coverage in root. Launch /coverage/index.html to view coverage in browser

## Deployment:
> Click [this link](https://whatifgame.herokuapp.com/"whatifgame.herokuapp.com") to check out the online version on Heroku. (Might have unknown bugs while in development)

> **ADMIN:** Log in with e-mail: admin@admin.admin, psw: adminadmin to log in as admin user

## User stories

> As a user i want to log in, in order to play the game

> As a user i want to play the game, in order to entertain myself

> As a user i want to see how many answered the same as me on the last question, in order to learn more about myself

> As a user i want to create my own questio,n in order to contribute to the game

> As a user i want to see a list with information about my questions, in order to see information about it

> As a user i want to view my own profile, in order to see my information

> As a user i want to edit my profile, in order to correct it

> As a user i want to update my name, picture or email, in order to correct it

> As a user i want to change my password ,in order to update it

> As a user i want to log out, in order to end my session

> As a user i want to see information about the developer, in order to contact him

----------------------------------
> As a admin i want to view a list over all users, in order to CRUD their profiles

> As a admin i want to view a list over all questions, in order to CRUD them
