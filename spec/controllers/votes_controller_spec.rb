require 'spec_helper'

describe VotesController do 
  context 'routing' do
    it {should route(:post, '/votes').to :action => :create}
  end

  context 'POST create' do
    it 'creates a new vote' do
      expect {post :create}.to change(Vote, :count).by(1) 
    end
  end
end 