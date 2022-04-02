class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :AuthorId ,index: true
      t.integer :PostId ,index: true
      t.text :Text
      t.date :UpdatedAt
      t.date :CreatedAt
      t.timestamps
    end
  end
end
