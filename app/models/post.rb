class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  after_save :update_user_post_counter

  def self.recent_comments(post_id)
    post = Post.find_by(id: post_id)
    post.comments.order(created_at: :desc).limit(5)
  end

   private
    def update_user_post_counter
    user.update(posts_counter: user.posts.count)
  end
end
