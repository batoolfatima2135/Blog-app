class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.update_comment_counter(post_id)
    post = Post.find_by(id: post_id)
    post.update(comments_counter: post.comments.count)
  end
end
