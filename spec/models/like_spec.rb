require 'rails_helper'

RSpec.describe Like, type: :model do
 it 'update likes_counter of post' do
    user = User.new(name: "Mark")
    post = Post.create(title: 'Test Post', user: user)
    like1 = Like.create(post: post, user: user)
    like2 = Like.create(post: post, user: user)
    like3 = Like.create(post: post, user: user)
    like4 = Like.create(post: post, user: user)
    
    expect(post.likes_counter).to equal(4)
  end

end
