require 'spec_helper'

describe CommentsController do 
  context 'routing' do
    it {should route(:get, '/comments/new').to :action => :new}
    it {should route(:post, '/comments').to :action => :create}
  end

  context 'GET new' do 
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:text => "this thing is so commentable", :commentable_id => 1, :commentable_type => 'Post'}}
      let(:valid_parameters) {{:comment => valid_attributes}}

      it 'creates a new comment' do
        expect {post :create, valid_parameters}.to change(Comment, :count).by(1) 
      end

      before {post :create, valid_parameters}
      it {should redirect_to posts_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:text => "", :commentable_id => 1, :commentable_type => ''}}
      let(:invalid_parameters) {{:post => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end
end