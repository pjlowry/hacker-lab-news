require 'spec_helper'

describe VotesController do 
  context 'routing' do
    it {should route(:post, '/posts/1/votes').to :action => :create, :post_id => '1' }
  end

  context 'POST create' do
    let(:new_post) {FactoryGirl.create(:post)}
    context 'authorized session' do
      it 'creates a new vote' do

        user = FactoryGirl.create(:user)
        expect {post :create, {:post_id => new_post.id}, {'user_id' => user.id}}.to change(Vote, :count).by(1)
      end
    end

    context 'not authorized session' do

      before {post :create, {:votable_id => new_post.id}, {}}
      it {should redirect_to login_url}
    end
  end
end 