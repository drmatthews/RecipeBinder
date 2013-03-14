class List < ActiveRecord::Base
  attr_accessible :name, :user_id, :items_attributes
  belongs_to :user
  has_many :items, :order => :position
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:content].blank?},:allow_destroy => true
end
