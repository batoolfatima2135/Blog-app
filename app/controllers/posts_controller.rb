class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @index = params[:index]
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).paginate(page: params[:page], per_page: 2)
   
  end
end
