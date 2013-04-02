class CommentsController < ApplicationController
  def new
    @comment = Comment.new
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
end