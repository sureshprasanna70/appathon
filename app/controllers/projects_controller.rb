class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy,:complete]

  respond_to :html

  def index
    if user_signed_in?
        @projects = Project.all
        respond_with(@projects)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end
  def complete

  end
  def submodules
    @project_id=params[:id]
    @submodules=Submodule.where(:project_id=>params[:id])
    respond_to do |format|
      format.html
      format.js
    end

  end
  private
  def set_project
  if user_signed_in?
    @project = Project.find(params[:id])
  else
    redirect_to new_user_session_path
  end
  end

  def project_params
    params.require(:project).permit(:title, :desc)
  end
end
