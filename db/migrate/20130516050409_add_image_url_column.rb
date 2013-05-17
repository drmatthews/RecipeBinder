class AddImageUrlColumn < ActiveRecord::Migration
  def change
    add_column :pictures, :image_url, :string
  end

  def down
    remove_column :pictures, :image_url, :string    
  end
end
