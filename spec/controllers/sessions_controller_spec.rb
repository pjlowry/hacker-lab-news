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
      # binding.pry
      let(:valid_parameters) {{:email => 'abc1@gmail.com', :password => 'abc1234'}}
      # let(:user) {FactoryGirl.create(:user)}
      it 'should set the session to the user id' do 
        user = FactoryGirl.create(:user)
        post :create, valid_parameters
        should set_session(:user_id).to(user.id)
      end
      # before {post :create, valid_parameters}
      # it {should set_session(:user_id).to(278)}
    end

    context 'with invalid parameters' do
      let(:invalid_parameters) {{:email => 'abc1@gmail.com', :password => 'xyz5678'}}
      let(:user) {FactoryGirl.create(:user)}

      before {post :create, invalid_parameters}
      it {should_not set_session(:user_id)}
    end
  end

  context "DELETE destroy" do
    it {should_not set_session(:user_id)}
  end

end
