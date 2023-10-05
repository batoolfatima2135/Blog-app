class Api::V1::CommentsController < ApplicationController
  before_action :set_post, only: %i[index create]
  before_action :authenticate_user!, only: [:create]

  # GET /api/v1/users/:user_id/posts/:post_id/comments
  def index
    @comments = @post.comments
    render json: @comments
  end

  # POST /api/v1/posts/:post_id/comments
  # to get authentication token send POST request to http://localhost:3000/api/v1/auth/sign_in
  # Send email and password with the request
  # Authentication token for batoolfatima2135@gmail.com
  # Bearer eyJhY2Nlc3MtdG9rZW4iOiJsLUlvSHhNUXItc0VTdVBURTg0Y19RIiwidG9rZW4tdHlw
  # ZSI6IkJlYXJlciIsImNsaWVudCI6InYtekt4Y3lLR1gtUjJXcEdwQ3o0MGciLCJleHBpcnkiOiIx
  # Njk2NTI0NzY3IiwidWlkIjoiYmF0b29sZmF0aW1hMjEzNUBnbWFpbC5jb20ifQ==
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
