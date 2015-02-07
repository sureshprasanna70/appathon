class HooksController < ApplicationController
  before_action :set_hook, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if user_signed_in?
    @hooks = Hook.all
    respond_with(@hooks)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    respond_with(@hook)
  end

  def new
    if user_signed_in?
      @hook = Hook.new
      @hook.token=Digest::SHA1.hexdigest ("#{Time.now}")
      puts Hash.new(Time.now)
      respond_with(@hook)
    else
      redirect_to new_user_session_path
    end
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
      if user_signed_in?
        @hook = Hook.find(params[:id])
      else
        redirect_to new_user_session_path
      end
    end

    def hook_params
      params.require(:hook).permit(:name, :token, :purpose,:submodule_id)
    end
end
