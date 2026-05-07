class ApplicationController < ActionController::Base
  def authenticate_admin!
    unless session[:admin_logado]
      redirect_to root_path, alert: "Acesso restrito!"
    end
  end
end