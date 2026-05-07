class AdminController < ApplicationController

  before_action :authenticate_admin!


  def dashboard
    @projects = Project.all
  end

  private

  def check_auth
    puts "DEBUG: Verificando sessão..." # Isso vai aparecer no Log do Render
    if session[:admin_id].nil?
      puts "DEBUG: Sessão vazia! Redirecionando..."
      redirect_to login_path, alert: "Acesso negado."
    else
      puts "DEBUG: Usuário logado com ID: #{session[:admin_id]}"
    end
  end
end