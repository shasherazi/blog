require 'rails_helper'

user = FactoryBot.create(:user)

RSpec.describe 'user index page', type: :feature do
  scenario 'display username' do
    visit '/'
    expect(page).to have_content(user.name)
  end
end