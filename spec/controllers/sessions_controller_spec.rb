require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  context "POST create" do

    context 'with valid parameters' do
      it 'should set the session to the user id' do 
        user = FactoryGirl.create(:user)
        post :create, {:email => user.email, :password => user.password}
        should set_session(:user_id).to(user.id)
      end
    end

    context 'with invalid parameters' do
      let(:user) {FactoryGirl.create(:user)}

      before {post :create, {:email => user.email, :password => '1sze'}}
      it {should_not set_session(:user_id)}
    end
  end

  context "DELETE destroy" do
    it {should_not set_session(:user_id)}
  end

end
