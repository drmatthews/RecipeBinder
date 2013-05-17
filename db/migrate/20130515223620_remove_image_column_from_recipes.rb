class RemoveImageColumnFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :image
  end

  def down
    add_column :recipes, :image, :string
  end
end
