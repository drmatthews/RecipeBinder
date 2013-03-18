class ChangeNameColumnNameToItem < ActiveRecord::Migration
  def up
    rename_column :shopping_list_items, :name, :item
  end

  def down
  end
end
