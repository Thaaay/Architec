class ProjectsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_path, notice: 'Projeto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to admin_path, notice: 'Projeto atualizado.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_path, notice: 'Projeto apagado.'
  end

  private


  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "password123"
    end
  end

  def project_params

    params.require(:project).permit(:title, :description, :image, photos: [])
    params.require(:project).permit(:title, :description, :image, :tour_360, photos: [])
  end

end