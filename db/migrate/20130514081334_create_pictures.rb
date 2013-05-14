class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :image
      t.integer :recipe_id

      t.timestamps
    end
  end
end
