class Users < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'author_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'author_id'
  has_many :posts
  # Ex:- scope :active, -> {where(:active => true)}
  def most_recent_n(name = self, lim = 3)
    Posts.where(author_id: name).order(created_at: :desc).limit(lim)
  end
end
