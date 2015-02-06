class SubmodulesController < ApplicationController
  before_action :set_submodule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  if user_signed_in?
    @submodules = Submodule.all
    respond_with(@submodules)
  else
    redirect_to new_user_session_path
  end
  end

  def show
    respond_with(@submodule)
  end

  def new
    @submodule = Submodule.new
    @@project_id=params[:id]
    respond_to do |format|
      format.html
      format.js
    end

  end

  def edit
  end

  def create
    @submodule = Submodule.new(submodule_params)
    @submodule.project_id=@@project_id
    if @submodule.save
      redirect_to root_path
    else
      respond_with(@submodule)
    end
  end

  def update
    if @submodule.update(submodule_params)
      redirect_to root_path
    else
      respond_with(@submodule)
    end
  end

  def destroy
    @submodule.destroy
    respond_with(@submodule)
  end
  def bug
    @submodule=Submodule.find(params[:id])
    @bugs=Bug.where(:submodule_id=>params[:id])
    respond_to do |format|
      format.html
      format.js
    end

  end
  private
    def set_submodule
    if user_signed_in?
      @submodule = Submodule.find(params[:id])
    else
      redirect_to new_user_session_path
    end
    end

    def submodule_params
      params.require(:submodule).permit(:name, :desc, :deadline, :score,:project_id)
    end
end
