class AddCookingTimeColumnToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :cookingtime, :integer
    add_column :recipes, :preptime, :integer
    add_column :recipes, :cookingtimeunits, :string
    add_column :recipes, :preptimeunits, :string
  end

  def down
    remove_column :recipes, :cookingtime
    remove_column :recipes, :preptime
    remove_column :recipes, :cookingtimeunits
    remove_column :recipes, :preptimeunits
  end
end
