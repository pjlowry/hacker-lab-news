class VotesController < ApplicationController

  before_filter :authorize, only: [:create]

  def create
    Vote.create(params[:vote])
    redirect_to :posts
    # redirect_to :back
  end
end