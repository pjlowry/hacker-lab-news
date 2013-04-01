class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.new(params[:post])

    if post.save
      flash[:notice] = "Your post was successful!"
      redirect_to new_post_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "The post was successfully deleted."
    redirect_to posts_path
  end
end