# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
recipes = [{:title => 'Beans on toast', :category => 'veg', :chef => 'Dan', :ingredients => 'Beans, bread', :method => 'toast bread, heat beans'},
{:title => 'Eggs on toast', :category => 'veg', :chef => 'Dan', :ingredients => 'Eggs, bread', :method => 'toast bread, scramle eggs'}
]

recipes.each do |recipe|
  Recipe.create!(recipe)
end
=end
