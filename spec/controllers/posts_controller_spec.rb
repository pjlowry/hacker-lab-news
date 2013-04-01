require 'spec_helper'

describe PostsController do
  context 'routing' do
    it {should route(:get, '/posts/new').to :action => :new}    
    it {should route(:post, '/posts').to :action => :create}
  end

  context 'GET new' do 
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:source_url => "http://www.learnhowtoprogram.com/lessons/hacker-news-clone", :headline => "Hacker News Clone"}}
      let(:valid_parameters) {{:post => valid_attributes}}

      it 'creates a new post' do
        expect {post :create, valid_parameters}.to change(Post, :count).by(1) 
      end

      before {post :create, valid_parameters}
      it {should redirect_to posts_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:source_url => "", :headline => ""}}
      let(:invalid_parameters) {{:post => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end

  context 'DELETE destroy' do 
    it 'destroys a post' do 
      post = FactoryGirl.create :post
      expect {delete :destroy, {:id => post.id}}.to change(Post, :count).by(-1)
    end
    
    let(:post) {FactoryGirl.create :post}
    before {delete :destroy, {:id => post.id}}

    it {should redirect_to posts_path}
    it {should set_the_flash[:notice]}
  end
end