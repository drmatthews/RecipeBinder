ThinkingSphinx::Index.define :recipe, :with => :active_record do
  indexes title
  indexes tags(:name), :as => :tag_names
end
