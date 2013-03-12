class ShoppingListItems < ActiveRecord::Base
  attr_accessible :list_id, :name, :position, :quantity
  belongs_to :shopping_list
  act_as_list :scope => :shopping_list
end
