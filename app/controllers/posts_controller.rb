class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @index = params[:index]
    @user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_posts_path(id: current_user.id)
    else
      flash.now[:alert] = 'Cannot create a new post'
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments, :user).paginate(page: params[:page], per_page: 10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
