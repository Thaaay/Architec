class ContactMailer < ApplicationMailer
  default from: 'archwayt2025@gmail.com'

  def contact_email(contact_params)
    @params = contact_params
    mail(
      to: 'archwayt2025@gmail.com',
      subject: "NOVO CONTATO: #{@params[:subject]} - #{@params[:name]}"
    )
  end
end
