class AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
   
    unless session[:admin_id]
      redirect_to login_path, alert: "Access Denied. Identity required."
    end
  end
end