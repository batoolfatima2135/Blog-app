class Api::V1::CommentsController < ApplicationController
  before_action :set_post, only: %i[index create]
  before_action :authenticate_user!, only: [:create]

  # GET /api/v1/users/:user_id/posts/:post_id/comments
  def index
    @comments = @post.comments
    render json: @comments
  end

  # POST /api/v1/posts/:post_id/comments

  def create
    if current_user.nil?
      render json: { errors: ['Authentication required'] }, status: :unauthorized
      return
    end
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity

    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
