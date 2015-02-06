class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bugs = Bug.all
    respond_with(@bugs)
  end

  def show
    respond_with(@bug)
  end

  def new
    @bug = Bug.new
    @@submodule_id=params[:submodule_id]
    respond_with(@bug)
  end

  def edit
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.submodule_id=@@submodule_id
    @bug.save
    respond_with(@bug)
  end

  def update
    @bug.update(bug_params)
    respond_with(@bug)
  end

  def destroy
    @bug.destroy
    respond_with(@bug)
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:name, :desc, :assigned_to,:submodule_id)
    end
end
