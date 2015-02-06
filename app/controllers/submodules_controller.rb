class SubmodulesController < ApplicationController
  before_action :set_submodule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @submodules = Submodule.all
    respond_with(@submodules)
  end

  def show
    respond_with(@submodule)
  end

  def new
    @submodule = Submodule.new
    @project_id=params[:id]
    respond_with(@submodule)
  end

  def edit
  end

  def create
    @submodule = Submodule.new(submodule_params)
    @submodule.project_id=@project_id
    @submodule.save
    respond_with(@submodule)
  end

  def update
    @submodule.update(submodule_params)
    respond_with(@submodule)
  end

  def destroy
    @submodule.destroy
    respond_with(@submodule)
  end

  private
    def set_submodule
      @submodule = Submodule.find(params[:id])
    end

    def submodule_params
      params.require(:submodule).permit(:name, :desc, :deadline, :score,:project_id)
    end
end
