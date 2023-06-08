require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(
      name: 'John Doe',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
      bio: 'Hello I am a test user',
      posts_counter: 0
    )
  end

  let(:post) do
    Post.create(
      title: 'Test Post',
      text: 'This is a test post',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    Comment.new(
      text: 'This is a test comment',
      author: user,
      post: post
    )
  end

  describe 'Functionality' do
    it 'updates the comments_counter of the post after saving' do
      expect { subject.save }.to change { post.comments_counter }.by(1)
    end
  end
end
