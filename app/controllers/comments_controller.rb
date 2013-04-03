class CommentsController < ApplicationController
  before_filter :authorize, only: [:new]

  def new
    @comment = Comment.new(params[:comment])
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = "Your comment was successfully posted."
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @commentable = Post.find(params[:commentable_id])
    @comments = @commentable.comments
  end
end