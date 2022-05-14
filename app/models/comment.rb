class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def update_post_comments_counter(id, value)
    user = Post.where(id:)
    user.update(comments_counter: value.to_s)
  end
end
