class RemoveMisspelledImageUrlColumn < ActiveRecord::Migration
  def up
    remove_column :pictures, :iamge_url
  end

  def down
    add_column :pictures, :iamge_url, :string
  end
end
