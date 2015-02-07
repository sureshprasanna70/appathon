class BugsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :set_bug
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
  def make_bug
    if  request.headers["X-Github-Event"] == "issues"
      puts "here"
      puts params[:issue]
      @bug=Bug.new
      @bug.status=params[:issue][:state]
      @bug.name=params[:issue][:title] 
      @bug.assigned_to=params[:issue][:assignee]
      @bug.desc=params[:issue][:body]
      @bug.submodule_id=params[:submodule_id]
      puts @bug.status
      puts @bug.name
      puts @bug.submodule_id
      puts @bug.assigned_to
      if @bug.save
        puts "true"
      else
        puts @bug.errors.count
        @bug.errors.full_messages.each do |hi|
          puts hi
        end
      end
    end
  end
  private
  def set_bug
    if user_signed_in?
      @bug = Bug.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def set_csrf_cookie
    if protect_against_forgery?
      cookies['CSRF-TOKEN'] = form_authenticity_token
    end
  end
  def bug_params
    params.require(:bug).permit(:name, :desc, :assigned_to,:submodule_id,:status,:submodule_id)
  end
end
