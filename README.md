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

>> mandrill_psw: myp4ssw0rd0rT0ken


 Mail should now be sendable from your mailer

## Tests:
#### Run:
> \> rake db:migrate RAILS_ENV=test

> \> rake test

There should now be a folder /coverage' in root. Launch /coverage/index.html to view coverage in browser

## Deployment:
> Click [this link](https://whatifgame.herokuapp.com/"whatifgame.herokuapp.com") to check out the online version on Heroku. (Might have unknown bugs while in development)

> **ADMIN:** Log in with e-mail: admin@admin.admin, psw: adminadmin to log in as admin user
