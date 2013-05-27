class AddCookingtimeunitsToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :cookingtimeunits, :integer
  end
  
  def down
    remove_column :recipes, :cookingtimeunits
  end
end
