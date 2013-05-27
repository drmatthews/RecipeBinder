class AddPreptimeunitsToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :preptimeunits, :integer
  end
  
  def down
    remove_column :recipes, :preptimeunits
  end
end
