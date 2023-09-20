class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def self.recent_posts(id)
    user = User.find_by(id:)
    user.posts.order(created_at: :desc).limit(3)
  end
end
