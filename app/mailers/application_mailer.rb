class ApplicationMailer < ActionMailer::Base
  default from: 'noreply.whatifgame@whatifgame.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to WhatIf!')
  end
end