class Posts < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'post_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'post_id'
  def update_post_counter(id, value)
    user = Users.where(id:)
    user.update(posts_counter: value.to_s)
  end

  def most_recent_comments_n(id = self.id, lim = 5)
    Comments.where(post_id: id).order(created_at: :desc).limit(lim)
  end
end
