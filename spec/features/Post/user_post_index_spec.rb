require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  let!(:user) { User.create(name: 'user1', photo: 'https://instasize.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fmunkee%2Fimage%2Fupload%2Fw_1000%2Cc_fill%2Car_1%3A1%2Cg_auto%2Cr_max%2Fv1681855894%2Finstasize-website%2Flearn%2Fblonde-woman-selfie-instagram-influencer.webp&w=828&q=75') }
  let!(:post) { Post.create(author_id: user.id, title: "Test Post", text: "This is the body of the post.") }
  let!(:comment1) { Comment.create(user: user, post: post, text: "Comment 1") }
  let!(:comment2) { Comment.create(user: user, post: post, text: "Comment 2") }

  scenario 'Displays user profile picture' do
    visit user_posts_path(user)

    expect(page).to have_css("img[src='#{user.photo}']")
  end

  scenario 'Displays username' do
    visit user_posts_path(user)

    expect(page).to have_content(user.name)
  end

  scenario 'Displays number of posts by the user' do
    visit user_posts_path(user)

    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end

  scenario 'Displays post title' do
    visit user_posts_path(user)

    expect(page).to have_content(post.title)
  end

  scenario 'Displays some of the post body' do
    visit user_posts_path(user)

    expect(page).to have_content("This is the body of the post.")
  end

  scenario 'Displays the first comments on a post' do
    visit user_posts_path(user)

    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  scenario 'Displays the number of comments on a post' do
    visit user_posts_path(user)

    expect(page).to have_content("comments: #{post.comments_counter}")
  end

  scenario 'Displays the number of likes on a post' do
    visit user_posts_path(user)

    expect(page).to have_content("likes: #{post.likes_counter}")
  end

  scenario 'Displays pagination if there are more posts' do
    # Create additional posts to trigger pagination
    10.times { Post.create(author_id: user.id, title: "Test Post", text: "This is the body of the post.") }

    visit user_posts_path(user)

    expect(page).to have_css('.pagination')
  end

  scenario 'Redirects to post show page when clicked' do
    visit user_posts_path(user)

    click_link post.title
    sleep(1)
    expect(current_path).to eq(user_post_path(user, post))
  end
end
