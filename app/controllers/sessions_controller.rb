class SessionsController < ApplicationController
  def create
  
    usuario_digitado = params[:username]
    senha_digitada = params[:password]

  
    if usuario_digitado == ENV["ADMIN_USERNAME"] && senha_digitada == ENV["ADMIN_PASSWORD"]
      session[:admin_id] = true
      redirect_to new_project_path, notice: "Logada com sucesso!"
    else
      flash.now[:alert] = "Login ou senha incorretos"
      render :new
    end
  end

  def destroy
    session[:admin_logado] = nil
    redirect_to root_path, notice: "Saiu!"
  end
end