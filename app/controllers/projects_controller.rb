class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]
 

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit

  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_dashboard_path, notice: "Project created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to admin_dashboard_path, notice: "Project updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_dashboard_path, notice: "Project deleted."
  end

  private

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_dashboard_path, alert: "Project not found."
    end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :panorama_image, images: [])
  end

end