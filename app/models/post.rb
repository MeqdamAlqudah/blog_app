class Post < ApplicationRecord
  has_many :comment, class_name: 'Comment', foreign_key: 'post_id'
  has_many :like, class_name: 'Like', foreign_key: 'post_id'
  validates :title, presence: true
  validates :title, length: { minimum: 250 }
  validates :comments_counter, numericality: { only_integer: true }
  validates :comments_counter, numericality: { minimum: 0 }
  validates :likes_counter, numericality: { only_integer: true }
  validates :likes_counter, numericality: { minimum: 0 }

  def update_post_counter(id, value)
    user = User.where(id:)
    user.update(posts_counter: value.to_s)
  end

  def most_recent_comments_n(id = self.id, lim = 5)
    Comment.where(post_id: id).order(created_at: :desc).limit(lim)
  end

  def count_comments(_id = id)
    comments = comment
    comments.length
  end

  def count_likes(_id = id)
    likes = like
    likes.length
  end

  def create_comment(input_text, input_post_id = id, input_author_id = author_id)
    comment = self.comment.create(posts_id: input_post_id.to_i, post_id: input_post_id.to_i, author_id: input_author_id,
                                  text: input_text, users_id: input_author_id,
                                  created_at: Time.now.getutc,
                                  updated_at: Time.now.getutc)
    comment.id = self.comment.length
    comment
  end

  def create_like(input_post_id = id, input_author_id = author_id)
    like = self.like.create(post_id: input_post_id, author_id: input_author_id,
                            posts_id: post_id, users_id: author_id, created_at: Time.now.getutc,
                            updated_at: Time.now.getutc)
    like.id = self.like.length
    like
  end
end
f
