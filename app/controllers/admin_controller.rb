class AdminController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  layout "admin"

  def dashboard
    @projects = Project.all.order(created_at: :desc)
  end
end