class UserMailer < ActionMailer::Base
  default from: "rodrigomacazaga@gmail.com"

  def welcome_email(email, username, phone, msg)
    @email = email
    @username = username
    @phone = phone
    @msg = msg
    mail(to: "rodrigomacazaga@gmail.com", subject: 'El Encino - Nuevo Cliente')
  end

end