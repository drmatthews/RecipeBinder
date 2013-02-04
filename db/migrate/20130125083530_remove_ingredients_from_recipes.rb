class RemoveIngredientsFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :ingredients
  end

  def down
    add_column :recipes, :ingredients, :string
  end
end
