class Item < ActiveRecord::Base
  attr_accessible :name, :position, :quantity
  belongs_to :user
  validates :name, presence: true
  #act_as_list :scope => :list
end
