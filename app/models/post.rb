class Post < ApplicationRecord
  belongs_to :user, foreign_key: "author_id"
  has_many :likes, foreign_key: "post_id"
  has_many :comments, foreign_key: "post_id"
  
  def self.update_post_counter(user_id)
    user = User.find_by(id: user_id)
    user.update(posts_counter: user.posts.count)
  end

  def self.recent_comments(post_id)
    post = Post.find_by(id: post_id)
    post.comments.order(created_at: :desc).limit(5)
  end
 
end
