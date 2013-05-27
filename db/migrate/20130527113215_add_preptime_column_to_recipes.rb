class AddPreptimeColumnToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :preptime, :integer
  end
  
  def down
    remove_column :recipes, :preptime
  end
end
