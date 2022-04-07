class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.belongs_to :user , foreign_key: true
      t.belongs_to :post , foreign_key: true
      t.string :author_id,index: true
      t.text :text
      t.timestamps
    end
  end
end
