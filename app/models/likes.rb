class Likes < ApplicationRecord
    belongs_to :posts
    belongs_to :users
    def update_post_likes_counter(id,value)
        user = Posts.where(id: id)
        user.update(likes_counter:"#{value}")
    end
end