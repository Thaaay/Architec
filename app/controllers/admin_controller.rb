class AdminController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "password123"

  layout "admin"

  def dashboard
    @projects = Project.all.order(created_at: :desc)
  end
end