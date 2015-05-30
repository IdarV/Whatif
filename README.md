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

## Mailcatcher:
### For local mailcatching, run the following;

> \> gem install mailcatcher

> \> mailcatcher --smtp-port 1024

If you want to listen to default port (1025) remove the following line from config/environments/development.rb

> config.action_mailer.smtp_settings = {  port: 1024 }


 Mail can be read it at localhost:1080

## Tests:
#### Run:
> \> rake db:migrate RAILS_ENV=test

> \> rake test

> #### \# there should now be a folder /coverage' in root. Launch /coverage/index.html to view coverage in browser

## Deployment:
> Click [this link](https://whatifgame.herokuapp.com/"whatifgame.herokuapp.com") to check out the online version on Heroku. (Might have unknown bugs while in development)
