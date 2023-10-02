require 'rails_helper'

RSpec.feature 'User show page' do
  let!(:user1) { User.create(name: 'Mike', bio: 'this is test bio', photo: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500') }
  let!(:post1) { Post.create(user: user1, title: 'Test post 1') }
  let!(:post2) { Post.create(user: user1, title: 'Test post 2') }
  let!(:post3) { Post.create(user: user1, title: 'Test post 3') }

  scenario 'Displays user\'s Profile picture, username, bio and number of posts' do
    visit user_path(user1)
    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.bio)
    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
  end

  scenario 'Displays user\'s 3 posts' do
    visit user_path(user1)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post3.title)
  end

  scenario 'Displays Button that lets me view all of a user\'s posts, and redirects to the posts when clicked' do
    visit user_path(user1)
    expect(page).to have_link('See all posts')
    click_link 'See all posts'
    sleep(1)
    expect(current_path).to eq(user_posts_path(user1))
  end

  scenario 'click on user\'s post redirects to that post\'s show page.' do
    visit user_path(user1)

    click_link post1.title
    sleep(1)
    expect(current_path).to eq(user_post_path(user1, post1))
  end
end
