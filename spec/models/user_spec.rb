require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
      bio: 'Hello I am a test user',
      posts_counter: 0
    )
  end

  # before { subject.save } # save the subject before each test

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'is valid without a photo' do
    subject.photo = ''
    expect(subject).to be_valid
  end

  it 'is not valid when posts_counter is not an integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid when posts_counter is less than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
