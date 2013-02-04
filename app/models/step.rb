class Step < ActiveRecord::Base
  attr_accessible :content
  belongs_to :recipe
  validates :content, presence: true
end
