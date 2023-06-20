require 'rails_helper'

user = FactoryBot.create(:user)
post = FactoryBot.create(:post, author: user)

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
end