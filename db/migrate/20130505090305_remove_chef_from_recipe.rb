class RemoveChefFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :chef
  end

  def down
    add_column :recipes, :chef, :string
  end
end
