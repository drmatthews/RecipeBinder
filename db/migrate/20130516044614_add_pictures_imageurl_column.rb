class AddPicturesImageurlColumn < ActiveRecord::Migration
  def change
    add_column :pictures, :iamge_url, :string
  end
end
