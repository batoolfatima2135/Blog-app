class Api::V1::PostsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      posts = user.posts
    else
      posts = Post.all
    end
    render json: posts
  end
end
