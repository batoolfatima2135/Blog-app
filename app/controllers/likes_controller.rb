class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user 

    if @like.save
      flash[:success] = "Liked"
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = "Like could not be saved."
      redirect_to user_post_path(@user, @post)
    end
  end
 
end
