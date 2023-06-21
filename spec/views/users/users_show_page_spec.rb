require 'rails_helper'

user = FactoryBot.create(:user_with_posts)

RSpec.describe 'user show page', type: :feature do
  scenario 'dislpay user profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  scenario 'display username on the page' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'display the number of posts' do
    visit user_path(user)
    expect(page).to have_content(user.posts_counter)
  end

  scenario 'display user bio' do
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end

  scenario 'display button to view all users post' do
    visit user_path(user)
    expect(page).to have_link('See all posts')
  end

  scenario 'when clicked redirects to post show page' do
    visit user_path(user)
    post = user.posts.first
    click_link(href: user_post_path(user, post))
    expect(page).to have_content(post.text)
  end

  scenario 'when clicked redirects to post index page' do
    visit user_path(user)
    click_link('See all posts')
    expect(page).to have_content(user.name)
  end

  scenario 'display user last 3 posts' do
    visit user_path(user)
    user.three_most_recent_posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end
end
