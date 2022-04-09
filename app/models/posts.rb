class Posts < ApplicationRecord
  
  has_many :comment, class_name: 'Comment', foreign_key: 'post_id'
  has_many :like, class_name: 'Like', foreign_key: 'post_id'
  def update_post_counter(id, value)
    user = Users.where(id:)
    user.update(posts_counter: value.to_s)
  end

  def most_recent_comments_n(id = self.id, lim = 5)
    Comment.where(post_id: id).order(created_at: :desc).limit(lim)
  end
  def count_comments(id=self.id)
    comments = Comment.where(post_id: id)
    return comments.length
  end
  def count_likes(id = self.id)
    likes = Like.where(post_id: id)
    return likes.length
  end
  def create_comment(text,post_id=self.id,author_id=self.author_id)
    comment=Comment.create(post_id:post_id,author_id:author_id,text:text)
    comment.post_id = post_id.to_i
    # @comments.push(comment)
    return comment
  end
  def create_like(post_id=self.id,author_id=self.author_id)
    like=Like.create(post_id:post_id,author_id:author_id)
    @likes.push(like)
    return like
  end
end
