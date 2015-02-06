class HooksController < ApplicationController
  before_action :set_hook, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hooks = Hook.all
    respond_with(@hooks)
  end

  def show
    respond_with(@hook)
  end

  def new
    @hook = Hook.new
    respond_with(@hook)
  end

  def edit
  end

  def create
    @hook = Hook.new(hook_params)
    @hook.save
    respond_with(@hook)
  end

  def update
    @hook.update(hook_params)
    respond_with(@hook)
  end

  def destroy
    @hook.destroy
    respond_with(@hook)
  end

  private
    def set_hook
      @hook = Hook.find(params[:id])
    end

    def hook_params
      params.require(:hook).permit(:name, :token, :purpose)
    end
end
