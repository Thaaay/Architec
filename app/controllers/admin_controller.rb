class AdminController < ApplicationController
  # CONFIGURAÇÃO DE SEGURANÇA SIMPLES
  # Quando você acessar /admin, o navegador pedirá usuário e senha.
  # Usuário: admin
  # Senha: password123 (Mude isso depois!)
  http_basic_authenticate_with name: "admin", password: "password123"

  layout "admin" # Vamos criar um layout limpo para o admin

  def dashboard
    @projects = Project.all.order(created_at: :desc)
  end
end