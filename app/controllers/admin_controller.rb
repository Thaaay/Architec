class AdminController < ApplicationController

  http_basic_authenticate_with name: ENV.fetch("ADMIN_USERNAME") { "admin" },
                               password: ENV.fetch("ADMIN_PASSWORD") { "admin" }

  layout "admin"

  def dashboard
    @projects = Project.all
  end
end