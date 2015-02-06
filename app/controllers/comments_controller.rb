class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    @@submodule_id=params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.comment_owner=current_user.email
    @comment.submodule_id=@@submodule_id  #params[:id]
    @comment.save
    respond_with(@comment)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content,:comment_owner,:submodule_id)
  end
end
