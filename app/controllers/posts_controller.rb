class PostsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = "Your post was successful!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.ranked
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "The post was successfully deleted."
    redirect_to posts_path
  end

end