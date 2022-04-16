class Like < ApplicationRecord
  belongs_to :posts
  belongs_to :users
  def update_post_likes_counter(id, value)
    user = Posts.where(id:)
    user.update(likes_counter: value.to_s)
  end
end
