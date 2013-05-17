class RemoveImageurlColumnFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :image_url
  end

  def down
    add_column :pictures, :image_url, :string
  end
end
