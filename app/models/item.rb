class Item < ActiveRecord::Base
  attr_accessible :list_id, :name, :position, :quantity
  belongs_to :list
  #act_as_list :scope => :list
end
