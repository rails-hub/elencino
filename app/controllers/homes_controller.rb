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
     send_quotation(@lot) if user_params[:type] === "both"
     render "shared/_quotation"
  end

  def download_quote
     @lot = Lot.find(params[:id])
     html = render_to_string(:partial => 'homes/download_quote.html.haml')
     kit = PDFKit.new(html, :page_size => 'Letter')
     kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/quote.css"
     pdf = kit.to_pdf
     send_data pdf, :type => 'application/pdf', :filename => 'ElencinoQuotation.pdf'

     # htm = render_to_string(:partial => 'homes/download_quote.html.haml')
     # respond_to do |format|
     #   format.pdf do
     #     data = DocRaptor.create(:document_content => htm, :document_type => "pdf")
     #     send_data data, :type => 'application/pdf', :filename => 'ElencinoQuotation.pdf'
     #   end
     #   format.html do
     #     render "homes/_download_quote.html.haml"
     #   end
     # end
  end

  def send_quotation(lot)
    html = render_to_string(:partial => 'homes/download_quote.html.haml')
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/quote.css"
    pdf = kit.to_pdf
    UserMailer.quotation_email(lot, pdf, user_params[:email]).deliver
  end

  private

  def mail_params
    params.permit(:phone, :email, :username, :msg)
  end

  def user_params
    params.require(:user).permit(:phase , :block, :lot, :username, :email, :phone, :type)
  end
end
