class VotesController < ApplicationController
  def create
    Vote.create(params[:vote])
    redirect_to posts_path
  end


  def index
    @votes = Vote.where(:votable_id => params[:votable_id])
  end
end