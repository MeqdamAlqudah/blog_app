class AddCommentsRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :PostId, null: false, foreign_key: true
  end
end
