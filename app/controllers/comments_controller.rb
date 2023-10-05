class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = @user.comments.build(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'Comment could not be saved.'
    end
    redirect_to user_post_path(current_user, @comment.post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    redirect_url = request.referer || fallback_url

    if @comment.destroy
      redirect_to redirect_url, notice: 'Comment was successfully deleted.'
    else
      redirect_to redirect_url, alert: 'Failed to delete the comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
