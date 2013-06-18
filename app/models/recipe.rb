class Recipe < ActiveRecord::Base
  belongs_to :user
  has_one :picture, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :steps, :reject_if => lambda { |a| a[:content].blank?},:allow_destroy => true
  validates :cookingtime,:preptime,:cookingtimeunits,:preptimeunits,:user_id, :tag_list, :description, :title, presence: true
  validates_associated :ingredients, :steps
  
  attr_accessible :cookingtime,:preptime,:cookingtimeunits,:preptimeunits,:category, :tag_list, :description, :title, :ingredients_attributes, :steps_attributes, :file

  include PgSearch
  pg_search_scope :search, against: [:title],
  using: {tsearch: {dictionary: "english"}},
  associated_against: {tags: :name, ingredients: :content}
  #if respond_to? :define_index
  #  define_index do
  #    indexes title
  #    indexes tags(:name), :as => :tag_names
  #  end
  #end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).recipes
  end

  def self.tag_counts
    Tag.select("tags.*,count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
  
  def self.all_tags
    Tag.select(:name).uniq.map{|x| x.name}
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
