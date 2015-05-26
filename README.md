# Whatif...
### Whatif is a game where your morals will be conflicted by your ego and self esteem

# Info
## Mailcatcher:
### For local mailcatching, do the following;

> gem install mailcatcher

> mailcatcher --smtp-port 1024

If you want to listen to default port (1025) remove the following line from config/environments/development.rb

> config.action_mailer.smtp_settings = {  port: 1024 }


 Mail can be read it at localhost:1080

#### Click [this link](https://whatifgame.herokuapp.com/"whatifgame.herokuapp.com") to check out the online version on Heroku. (Might have unknown bugs while in development)
