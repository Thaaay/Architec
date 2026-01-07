class ApplicationController < ActionController::Base
  def authenticate_admin!
   
    if session[:admin_id].nil?
      redirect_to login_path, alert: "Acesso restrito."
    end
  end
end