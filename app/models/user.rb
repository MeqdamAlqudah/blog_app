class User < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :post
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }
  validates :posts_counter, numericality: { minimum: 0 }
  # Ex:- scope :active, -> {where(:active => true)}
  def most_recent_n(id = self.id, lim = 3)
    Post.where(author_id: id).order(created_at: :desc).limit(lim)
  end

  def count_posts(name = id)
    posts = Post.where(author_id: name)
    posts.length
  end

  def get_all_posts(id = self.id)
    posts = Post.where(author_id: id)
    dic = {}
    count = 1
    posts.each do |single|
      dic[count] = single
      count += 1
    end

    dic
  end
end