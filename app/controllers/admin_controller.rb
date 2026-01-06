class AdminController < ApplicationController
  before_action :authenticate_admin!

  def dashboard
    
    @projects = Project.all 
  end

  private

  def authenticate_admin!
    unless session[:admin_id]
      redirect_to login_path, alert: "Access Denied."
    end
  end
end