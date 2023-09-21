require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is valid with non-negative integer as post counter' do
    user = User.new(name: 'David', posts_counter: 3)

    expect(user).to be_valid
  end

  it 'is valid with post counter equal to zero' do
    user = User.new(name: 'Mark', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is not valid with a negative number as post counter' do
    user = User.new(name: 'Kevin', posts_counter: -5)
    expect(user).to_not be_valid
  end

  context '.recent_posts should' do
    before :all do
      @user = User.new(name: 'John Doe')
      @post1 = Post.create(title: 'First Post', user: @user, created_at: 3.days.ago)
      @post2 = Post.create(title: 'Second Post', user: @user, created_at: 2.day.ago)
      @post3 = Post.create(title: 'Third Post', user: @user, created_at: 1.day.ago)
      @post4 = Post.create(title: 'recent Post', user: @user, created_at: Time.current)
      @recent_posts = User.recent_posts(@user)
    end

    it 'only returns 3 recent posts' do
      expect(@recent_posts).to contain_exactly(@post4, @post3, @post2)
    end

    it 'not return older post' do
      expect(@recent_posts).to_not contain_exactly(@post1)
    end

    it 'return post in decending order' do
      @recent_posts.each_cons(2) do |post, next_post|
        expect(post.created_at).to be >= next_post.created_at
      end
    end
  end
end
