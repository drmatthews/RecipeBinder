class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.string :ingredients
      t.string :method
      t.string :chef

      t.timestamps
    end
  end
end
