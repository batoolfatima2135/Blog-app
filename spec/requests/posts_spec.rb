require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:valid_attributes) do
    {
      name: 'Mark'
    }
  end

  describe 'GET /index' do
    before :each do
      @user = User.create! valid_attributes
      get user_posts_path(@user)
    end
    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create! valid_attributes
      @post = @user.posts.create(title: 'Test post')
      get user_post_path(@user, @post)
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Comments')
    end
  end
end
