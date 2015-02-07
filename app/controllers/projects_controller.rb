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
    if @project.save
      redirect_to root_path
    else
      respond_with(@project)
    end
  end

  def update
    if @project.update(project_params)
      redirect_to root_path
    else
    respond_with(@project)
    end
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end
  def submodules
    @project_id=params[:id]
    @submodules=Submodule.where(:project_id=>params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  def team
    @@project_id=params[:id]
  end
  def add_to_team()
    puts params
    teammate=User.where(:email=>params[:member]).first
    project=Project.find(@@project_id)
    if teammate==nil
      flash[:alert]="User not found"
    else
      teammate.add_role project.id
      flash[:notice]="User added"
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
