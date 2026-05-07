class ContactMailer < ApplicationMailer
  def contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]

    mail(to: "archwayt2025@gmail.com", subject: "Novo Contato: #{@subject}")
  end
end
