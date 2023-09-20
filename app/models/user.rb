class User < ApplicationRecord
  has_many :posts, foreign_key: "author_id"

   def self.recent_posts(id)
    user = User.find_by(id: id)
    user.posts.order(created_at: :desc).limit(3)
  end
end
