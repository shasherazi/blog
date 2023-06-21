require_relative '../rails_helper'

RSpec.describe Like, type: :model do
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
    Like.new(
      author: user,
      post:
    )
  end

  describe 'Functionality' do
    it 'updates the likes_counter of the post after saving' do
      expect { subject.save }.to change { post.likes_counter }.by(1)
    end
  end
end
