require 'rails_helper'

post = FactoryBot.create(:post_with_comments)

RSpec.describe 'post show page', type: :feature do
  scenario 'display post title' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.title)
  end

  scenario 'display post author' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.author.name)
  end

  scenario 'display number of comments' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.comments_counter)
  end

  scenario 'display number of likes' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.likes_counter)
  end

  scenario 'display username of each commenter' do
    visit user_post_path(post.author, post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  scenario 'display text of each comment' do
    visit user_post_path(post.author, post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  scenario 'display post text' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.text)
  end
end
