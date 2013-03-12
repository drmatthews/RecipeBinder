class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.string :name
      t.integer :list_id
      t.integer :position
      t.integer :quantity

      t.timestamps
    end
  end
end
