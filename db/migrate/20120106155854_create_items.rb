class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.string :price
      t.string :description

      t.timestamps
    end
	add_index :items, [:user_id, :created_at]
  end
end
