require 'spec_helper'

describe PostsController do
  context 'routing' do
    it {should route(:get, '/posts/new').to :action => :new}    
    it {should route(:post, '/posts').to :action => :create}
  end

  context 'GET new' do
    let(:user) {FactoryGirl.create(:user)}

    context 'in authorized session' do
        
      before {get :new, {}, {'user_id' => user.id}}
      it {should render_template :new}
    end

    context 'not authorized session' do
      
      before {get :new, {}, {}}
      it {should redirect_to login_url}
    end
  end

  context 'POST create' do
    let(:valid_attributes) {{:source_url => "http://www.learnhowtoprogram.com/lessons/hacker-news-clone", :headline => "Hacker News Clone"}}
    let(:valid_parameters) {{:post => valid_attributes}}

    context 'in authorized session' do
      let(:user) {FactoryGirl.create(:user)}

      context 'with valid_parameters' do
          
        before {post :create, valid_parameters, {'user_id' => user.id}}

        it 'creates a post' do
          expect {post :create, valid_parameters, {'user_id' => user.id}}.to change(Post, :count).by(1)
        end

        it {should redirect_to posts_path}
        it {should set_the_flash[:notice]}
      end

      context 'with invalid_parameters' do 
        let(:invalid_attributes) {{:source_url => "", :headline => ""}}
        let(:invalid_parameters) {{:post => invalid_attributes}} 
        before {post :create, invalid_parameters, {'user_id' => user.id}}

        it {should render_template :new}  
      end
    end

    context 'not authorized session' do  
      before {post :create, valid_parameters, {}}
      it {should redirect_to login_url}
    end
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end

  context 'DELETE destroy' do 
    context 'in authorized session' do 
      let(:user) {FactoryGirl.create(:user)}
      let(:post) {FactoryGirl.create(:post)}

        
      before {delete :destroy, {:id => post.id}, {'user_id' => user.id}}

      it 'destroys a post' do
        post = FactoryGirl.create(:post)
        expect {delete :destroy, {:id => post.id}}.to change(Post, :count).by(-1)
      end

      it {should redirect_to posts_path}
      it {should set_the_flash[:notice]}
    end

    context 'not authorized session' do 
      let(:post) {FactoryGirl.create(:post)}
      
      before {delete :destroy, {:id => post.id}, {}}
      it {should redirect_to login_url}
    end
  end
end