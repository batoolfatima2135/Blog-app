class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.update_like_counter(post_id)
    post = Post.find_by(id: post_id)
    post.update(likes_counter: post.likes.count)
  end
end
