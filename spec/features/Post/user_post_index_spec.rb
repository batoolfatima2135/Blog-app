require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  let!(:user) { User.create(name: 'user1', photo: 'https://instasize.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fmunkee%2Fimage%2Fupload%2Fw_1000%2Cc_fill%2Car_1%3A1%2Cg_auto%2Cr_max%2Fv1681855894%2Finstasize-website%2Flearn%2Fblonde-woman-selfie-instagram-influencer.webp&w=828&q=75') }
  let!(:post) { Post.create(author_id: user.id, title: 'Test Post', text: 'This is the body of the post.') }
  let!(:comment1) { Comment.create(user:, post:, text: 'Comment 1') }
  let!(:comment2) { Comment.create(user:, post:, text: 'Comment 2') }

  scenario 'Displays username, profile picture, number of posts and total likes' do
    visit user_posts_path(user)

    expect(page).to have_css("img[src='#{user.photo}']")
    expect(page).to have_content(user.name)

    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content("likes: #{post.likes_counter}")
  end

  scenario 'Displays post title and some of the post body' do
    visit user_posts_path(user)

    expect(page).to have_content(post.title)
    expect(page).to have_content('This is the body of the post.')
  end

  scenario 'Displays the first comments on a post & total comments' do
    visit user_posts_path(user)

    expect(page).to have_content(comment2.text)
    expect(page).to have_content("comments: #{post.comments_counter}")
  end

  scenario 'Displays pagination if there are more posts' do
    10.times { Post.create(author_id: user.id, title: 'Test Post', text: 'This is the body of the post.') }

    visit user_posts_path(user)

    expect(page).to have_css('.pagination')
  end
end
