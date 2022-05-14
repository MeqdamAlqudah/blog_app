class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def update_post_likes_counter(id, value)
    user = Post.where(id:)
    user.update(likes_counter: value.to_s)
  end
end
