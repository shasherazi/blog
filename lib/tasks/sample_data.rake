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
      photo: 'https://cdna.artstation.com/p/assets/images/images/029/616/034/large/alyssa-niziol-pfpsketch2-smol.jpg?1598115021',
      bio: "First user's bio",
      posts_counter: 0
    )

    # first post
    first_post = Post.create!(
      title: 'First post',
      text: "first post's text",
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
    20.times do |n|
      user = User.create!(
        name: "User #{n + 1}",
        photo: 'https://cdna.artstation.com/p/assets/images/images/029/616/034/large/alyssa-niziol-pfpsketch2-smol.jpg?1598115021',
        bio: "User #{n + 1}'s bio",
        posts_counter: 0
      )

      # create 5 posts for each user
      5.times do |m|
        post = Post.create!(
          title: "Post #{m + 1}",
          text: "Post #{m + 1}'s text",
          comments_counter: 0,
          likes_counter: 0,
          author: user
        )

        # create 2 likes for each post
        2.times do |_l|
          Like.create!(
            author: user,
            post: post
          )
        end

        # create 3 comments for each post
        3.times do |k|
          Comment.create!(
            text: "Comment #{k + 1}",
            author: user,
            post: post
          )
        end
      end
    end
  end
end
