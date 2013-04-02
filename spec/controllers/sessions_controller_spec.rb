require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  context "POST create" do
    let(:valid_parameters) {{:email => 'abc1@gmail.com', :password => 'abc1234'}}

    let(:user) {FactoryGirl.create(:user)}
    before {post :create, valid_parameters}
    it {should set_session(:user_id).to(user.id)}
  end

  context "DELETE destroy" do
    it {should_not set_session(:user_id)}
  end

end
