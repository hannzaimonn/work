class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.text :body,                          null: false
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true,null: false

      t.timestamps
    end
  end
end
