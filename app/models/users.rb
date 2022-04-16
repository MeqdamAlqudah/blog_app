class Users < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :posts
  # Ex:- scope :active, -> {where(:active => true)}
  def most_recent_n(id = self.id, lim = 3)
    Posts.where(author_id: id).order(created_at: :desc).limit(lim)
  end

  def count_posts(name = self.id)
    posts = Posts.where(author_id: name)
    posts.length
  end

  def get_all_posts(id = self.id)
    posts = Posts.where(author_id: id)
    dic = {}
    count = 1
    posts.each do |single|
      dic[count] = single
      count += 1
    end

    dic
  end
end
