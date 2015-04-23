class UserMailer < ActionMailer::Base
  default from: "david@displayadtech.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset Instructions - Display {AdTech}"
  end
  
end
