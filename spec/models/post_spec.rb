require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'John Doe',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
      bio: 'Hello I am a test user',
      posts_counter: 0
    )
  end

  subject do
    Post.new(
      title: 'Test Post',
      text: 'This is a test post',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid when title is longer than 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'is not valid when comments_counter is not an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid when comments_counter is less than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid when likes_counter is not an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid when likes_counter is less than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    it 'returns the five most recent comments' do
      10.times do |i|
        Comment.create(
          text: "This is the text for comment #{i}",
          post: subject,
          author: user
        )
      end

      expect(subject.five_most_recent_comments.count).to eq(5)
    end

    it 'updates the posts_counter of the author after saving' do
      expect { subject.save }.to change { user.posts_counter }.by(1)
    end
  end
end
