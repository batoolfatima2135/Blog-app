class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_post_comment_counter

  private

  def update_post_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
