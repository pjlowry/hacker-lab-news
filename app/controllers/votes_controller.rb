class VotesController < ApplicationController
  def create
    Vote.create(params[:vote])
    redirect_to posts_path
  end
end