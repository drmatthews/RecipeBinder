class ChangeListidColumnName < ActiveRecord::Migration
  def up
    rename_column :shopping_list_items, :list_id, :shopping_list_id
  end

  def down
  end
end
