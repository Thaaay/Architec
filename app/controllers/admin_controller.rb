class AdminController < ApplicationController
  before_action :authorize_admin

  def dashboard
    @projects = Project.all.order(created_at: :desc)
  end

  private

  def authorize_admin
    redirect_to login_path unless session[:admin_id]
  end
end