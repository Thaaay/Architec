class PagesController < ApplicationController
  def home
    # Busca os primeiros 4 projetos do banco de dados para exibir na View
    @projects = Project.limit(4)
  end

  def contact
  end

  def studio
  end
end