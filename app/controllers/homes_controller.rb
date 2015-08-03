class HomesController < ApplicationController

  def masterplan

  end

  def amenidades
    redirect_to homes_path :anchor => "features"
  end

  def gallery

  end

  def disponibilidad
    @phases = Phase.all
  end

  def facilidades

  end

  def cotizador
    redirect_to disponibilidad_homes_path :anchor => "cotizador"
  end

  def contacto

  end

  def send_email
    @email = mail_params[:email]
    @phone = mail_params[:phone]
    @username = mail_params[:username]
    @msg = mail_params[:msg]

    UserMailer.welcome_email(@email, @username, @phone, @msg).deliver
    render :json => {:message => "success"}
  end

  def quotation
     @lot = Lot.where('id= ?', user_params[:lot]).first
     render "shared/_quotation"
  end

  def download_quote
     @lot = Lot.find(params[:id])
     # html =  render_to_string(:partial => 'shared/download_quote')
     # kit = PDFKit.new(html)
     #
     # # confirm the export directory exists
     # export_directory = "#{Rails.root}/tmp/quotes"
     # Dir.mkdir(export_directory) unless Dir.exist?(export_directory)
     #
     # # create unique directory for this export
     # file_directory = "#{export_directory}/#{SecureRandom.hex}"
     # Dir.mkdir(file_directory) unless Dir.exist?(file_directory)
     #
     # # generate the file - this should use kit.to_pdf to do it all in memory, but there appears to be a bug in kit.to_pdf
     # file = kit.to_file("#{file_directory}/#{file_name}.pdf")
     #
     # render :json => {:url => export_file.asset.url}

  end

  private

  def mail_params
    params.permit(:phone, :email, :username, :msg)
  end

  def user_params
    params.permit(:phase , :block, :lot, :username, :email, :phone)
  end
end
