require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'update comments_counter of post' do
    user = User.new(name: 'Mark')
    post = Post.create(title: 'Test Post', user:, text: 'Hi Tom!')
    Comment.create(post:, user:, text: 'Hi Tom!')
    Comment.create(post:, user:, text: 'Hi Tom!')
    Comment.create(post:, user:, text: 'Hi Tom!')
    Comment.create(post:, user:, text: 'Hi Tom!')

    expect(post.comments_counter).to equal(4)
  end
end
