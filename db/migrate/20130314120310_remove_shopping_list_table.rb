class RemoveShoppingListTable < ActiveRecord::Migration
  def up
    drop_table :shopping_lists
    drop_table :shopping_list_items
  end

  def down
  end
end
