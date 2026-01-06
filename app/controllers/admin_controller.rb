class AdminController < ApplicationController
  # 1. Certifique-se que o nome do método aqui é IGUAL ao do private
  before_action :check_auth 

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