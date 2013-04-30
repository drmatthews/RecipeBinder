class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :recipe
  # attr_accessible :title, :body
end
