require 'rails_helper'

user = FactoryBot.create(:user)
post = FactoryBot.create(:post, author: user)

RSpec.describe 'user show page', type: :feature do
  scenario 'dislpay user profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src='#{user.photo}']")
  end
end