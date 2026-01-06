class ApplicationController < ActionController::Base
  private

  def authenticate_admin!
    unless session[:admin_id]
      redirect_to login_path, alert: "Por favor, faça login."
    end
  end
end