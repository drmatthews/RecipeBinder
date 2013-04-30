class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :ingredients, :steps, :reject_if => lambda { |a| a[:content].blank?},:allow_destroy => true
  validates :user_id, :tag_list, :chef, :title, presence: true
  validates_associated :ingredients, :steps
  attr_accessible :category, :tag_list, :chef, :title, :ingredients_attributes, :steps_attributes, :image, :remote_image_url
  mount_uploader :image, ImageUploader

  def self.tagged_with(name)
    Tag.find_by_name!(name).recipes
  end

  def self.tag_counts
    Tag.select("tags.*,count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
