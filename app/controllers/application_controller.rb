class ApplicationController < ActionController::Base
 
  def authenticate_admin!
    unless session[:admin_id]
      redirect_to login_path, alert: "Acesso restrito. Por favor, faça login."
    end
  end
end