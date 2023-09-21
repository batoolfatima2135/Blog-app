require 'rails_helper'

RSpec.describe Comment, type: :model do
   it 'update comments_counter of post' do
    user = User.new(name: "Mark")
    post = Post.create(title: 'Test Post', user: user, text: 'Hi Tom!')
    comment1 = Comment.create(post: post, user: user, text: 'Hi Tom!')
    comment2 = Comment.create(post: post, user: user, text: 'Hi Tom!')
    comment3 = Comment.create(post: post, user: user, text: 'Hi Tom!')
    comment4 = Comment.create(post: post, user: user, text: 'Hi Tom!')
    
    expect(post.comments_counter).to equal(4)
  end
end
