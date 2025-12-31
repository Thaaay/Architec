class ApplicationController < ActionController::Base

  private

  def authorize_admin
   
    unless session[:admin_id]
      redirect_to login_path, alert: "Authorized architects only."
    end
  end
end