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

  context 'GET index' do

    context 'with parameters' do
      let(:valid_attributes) {{:votable_id => 1, :votable_type => Post}}
      let(:valid_parameters) {{:vote => valid_attributes}}

      it 'returns all votes with given votable_id' 
        # expect {get :index, valid_attributes}.to return(1)
        # Vote = double
        # Vote.should_receive(:all)
      

    end
  end
end 