class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :price
      t.string :book_class
      t.integer :user_id

      t.timestamps
    end
  end
end
