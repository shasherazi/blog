require 'rails_helper'

user = FactoryBot.create(:user)

RSpec.describe 'user index page', type: :feature do
  scenario 'display username' do
    visit '/'
    expect(page).to have_content(user.name)
  end

  scenario 'display user profile picture' do
    visit '/'
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  scenario 'display number of post for a given user' do
    visit '/'
    expect(page).to have_content(user.posts_counter)
  end
end