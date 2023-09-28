class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user # Assuming you have user authentication in place

    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'Comment could not be saved.'
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text) # Permit :text instead of :content
  end
end
