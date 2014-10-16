class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/new'
    mail(to: @user.email, subject: 'Play love and friendship')
  end
end
