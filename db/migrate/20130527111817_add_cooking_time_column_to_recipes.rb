class AddCookingTimeColumnToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :cookingtime, :integer
  end
  
  def down
    remove_column :recipes, :cookingtime
  end
end
