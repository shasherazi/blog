class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  after_save :update_likes_counter

  def update_likes_counter
    author.update(likes_counter: author.likes.count)
  end
end
