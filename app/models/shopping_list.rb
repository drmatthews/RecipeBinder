class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :shopping_list_items, :order => :position
end
