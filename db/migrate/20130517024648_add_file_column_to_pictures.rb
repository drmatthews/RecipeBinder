class AddFileColumnToPictures < ActiveRecord::Migration
  def up
    add_column :pictures, :file, :string
  end

  def down
    remove_column :pictures, :file
  end
end
