class ContactsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    ContactMailer.contact_email(contact_params).deliver_later


    redirect_to contact_path, notice: "Thank you for your message! We will get back to you soon."
  rescue StandardError => e
    redirect_to contact_path, alert: "Oops! There was an issue sending your message. Please try again or contact us via email."
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
