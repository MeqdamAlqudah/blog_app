class Comments < ApplicationRecord
    belongs_to :posts
    belongs_to :users
    def update_post_comments_counter(id,value)
        user = Posts.where(id: id)
        user.update(comments_counter:"#{value}")
    end
end