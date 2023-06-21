require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  let!(:users) { FactoryBot.create_list(:user, 10) }

  scenario 'display username' do
    visit '/'
    users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'display user profile picture' do
    visit '/'
    users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  scenario 'display number of post for a given user' do
    visit '/'
    users.each do |user|
      expect(page).to have_content(user.posts.count)
    end
  end

  scenario 'when clicked redirects to user show page' do
    visit '/'
    users.each do |user|
      click_link(href: user_path(user))
      expect(page).to have_content(user.name)
      visit '/'
    end
  end
end
