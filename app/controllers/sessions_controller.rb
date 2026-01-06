class SessionsController < ApplicationController


  def new
  end

  def create

    if params[:username] == ENV["ADMIN_USERNAME"] && params[:password] == ENV["ADMIN_PASSWORD"]
      session[:admin_id] = true
      redirect_to admin_dashboard_path, notice: "Welcome back, Architect."
    else
      flash.now[:alert] = "Invalid credentials."
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Logged out."
  end
end