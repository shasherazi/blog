require 'faker'

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    puts 'Recreating the database...'

    # recreate the database
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke

    puts 'Deleted all data!'
    puts 'Creating sample data...'

    # first user
    first_user = User.create!(
      name: 'First User',
      email: 'first@user.com',
      password: 'firstuserpassword',
      photo: 'https://cdna.artstation.com/p/assets/images/images/029/616/034/large/alyssa-niziol-pfpsketch2-smol.jpg?1598115021',
      bio: "First user's bio",
      posts_counter: 0
    )

    # first post
    first_post = Post.create!(
      title: 'First post',
      text: 'Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.',
      comments_counter: 0,
      likes_counter: 0,
      author: first_user
    )

    Comment.create!(
      text: 'First comment',
      author: first_user,
      post: first_post
    )

    Like.create!(
      author: first_user,
      post: first_post
    )

    # create 20 users
    20.times do |_n|
      user = User.create!(
        name: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password,
        photo: Faker::Avatar.image,
        bio: Faker::Lorem.sentence(word_count: 10),
        posts_counter: 0
      )

      # create 5 posts for each user
      5.times do |_m|
        post = Post.create!(
          title: Faker::Lorem.sentence(word_count: 3),
          text: Faker::Lorem.paragraph(sentence_count: 10),
          comments_counter: 0,
          likes_counter: 0,
          author: user
        )

        # create 2 likes for each post
        2.times do |_l|
          Like.create!(
            author: user,
            post:
          )
        end

        # create 3 comments for each post
        3.times do |_k|
          Comment.create!(
            text: Faker::Lorem.sentence(word_count: 5),
            author: user,
            post:
          )
        end
      end
    end
  end
end
