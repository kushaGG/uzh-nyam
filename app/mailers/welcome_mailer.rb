class WelcomeMailer < ActionMailer::Base
  default from: "Uzh-Nyam@gmail.com"

   def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome, dear!', from:"Uzh-Nyam@gmail.com")
  end
end
