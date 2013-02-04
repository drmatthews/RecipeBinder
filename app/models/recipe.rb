class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps
  accepts_nested_attributes_for :ingredients, :steps, :allow_destroy => true
  validates :user_id, :category, :chef, :title, presence: true
  validates_associated :ingredients, :steps
  attr_accessible :category, :chef, :title, :ingredients_attributes, :steps_attributes
end
