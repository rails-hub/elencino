class HomesController < ApplicationController

  def masterplan

  end

  def amenidades
    redirect_to homes_path :anchor => "features"
  end

  def gallery

  end

  def disponibilidad

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

    UserMailer.welcome_email(@email, @username, @phone).deliver
    render :json => {:message => "success"}
  end

  private

  def mail_params
    params.permit(:phone, :email, :username)
  end
end
