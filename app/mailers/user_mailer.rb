class UserMailer < ActionMailer::Base
  default from: "rodrigomacazaga@gmail.com"

  def welcome_email(email, username, phone)
    @email = email
    @username = username
    @phone = phone
    mail(to: "rodrigomacazaga@gmail.com", subject: 'El Encino - Nuevo Cliente')
  end

end