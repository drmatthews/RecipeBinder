class Picture < ActiveRecord::Base
  attr_accessible :image, :name, :remote_image_url, :recipe_id
  belongs_to :recipe
  mount_uploader :image, ImageUploader
end
