class UserMailer < ActionMailer::Base
  default from: "rodrigomacazaga@gmail.com"

  def welcome_email(email, username, phone, msg)
    @email = email
    @username = username
    @phone = phone
    @msg = msg
    mail(to: "rodrigomacazaga@gmail.com", subject: 'El Encino - Nuevo Cliente')
  end

  def quotation_email(lot, pdf, user_email)
    @lot = lot
    attachments['elencino_quotation.pdf'] = pdf
    mail(to: "rodrigomacazaga@gmail.com, #{user_email}", subject: "Cotización - Manzana #{@lot.block.block_number} Lote #{@lot.lot_number}")
  end

end