class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if user_signed_in?
    @bugs = Bug.all
    respond_with(@bugs)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    respond_with(@bug)
  end

  def new
    @bug = Bug.new
    @@submodule_id=params[:submodule_id]
    respond_to do |format|
      format.html
      format.js
    end

  end

  def edit
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.submodule_id=@@submodule_id
    if @bug.save
      redirect_to root_path
    else
      respond_with(@bug)
    end
  end

  def update
    if @bug.update(bug_params)
      redirect_to root_path
    else
      respond_with(@bug)
    end
  end

  def destroy
    @bug.destroy
    respond_with(@bug)
  end

  private
  def set_bug
  if user_signed_in?
    @bug = Bug.find(params[:id])
  else
    redirect_to new_user_session_path
  end
  end

  def bug_params
    params.require(:bug).permit(:name, :desc, :assigned_to,:submodule_id,:status)
  end
end
