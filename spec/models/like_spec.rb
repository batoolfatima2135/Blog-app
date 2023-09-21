require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'update likes_counter of post' do
    user = User.new(name: 'Mark')
    post = Post.create(title: 'Test Post', user:)
    Like.create(post:, user:)
    Like.create(post:, user:)
    Like.create(post:, user:)
    Like.create(post:, user:)

    expect(post.likes_counter).to equal(4)
  end
end
