require 'rails_helper'

RSpec.feature 'User Index Page' do
  # Create some test users and posts
  let!(:user1) { User.create(name: 'user1', photo: 'https://instasize.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fmunkee%2Fimage%2Fupload%2Fw_1000%2Cc_fill%2Car_1%3A1%2Cg_auto%2Cr_max%2Fv1681855894%2Finstasize-website%2Flearn%2Fblonde-woman-selfie-instagram-influencer.webp&w=828&q=75') }
  let!(:user2) { User.create(name: 'user2', photo: 'https://instasize.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fmunkee%2Fimage%2Fupload%2Fw_1000%2Cc_fill%2Car_1%3A1%2Cg_auto%2Cr_max%2Fv1681855894%2Finstasize-website%2Flearn%2Fblonde-woman-selfie-instagram-influencer.webp&w=828&q=75') }
  let!(:post1) { Post.create(user: user1, title: 'test') }
  let!(:post2) { Post.create(user: user2, title: 'test') }

  scenario 'Displays usernames' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'Displays profile pictures' do
    visit users_path

    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end

  scenario 'Displays post counts' do
    visit users_path

    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{user2.posts_counter}")
  end

  scenario 'Redirects to user show page when clicked' do
    visit users_path

    click_link user1.name
    sleep(1)
    expect(current_path).to eq(user_path(user1))
  end
end
