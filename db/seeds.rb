require 'json'

file = IO.read(Rails.root.join('db/cocktails.json'))
cocktails_list = JSON.parse(file)

=begin
Each entry in the cocktails_list contains an object with the
following attributes:

{
  "name": "Mojito",
  "cdb_id": "11000",
  "alternate_name": null,
  "tags": "IBA,ContemporaryClassic,Alcoholic,USA",
  "category": "Cocktail",
  "instructions": "Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.",
  "image": "https://www.thecocktaildb.com/images/media/drink/rxtqps1478251029.jpg",
  "ingredients": [
    "Light rum",
    "Lime",
    "Sugar",
    "Mint",
    "Soda water"
  ],
  "measures": "2-3 oz, Juice of 1, 2 tsp, 2-4"
}
=end

p "--- Creating ingredients"
ingredients = cocktails_list.flat_map { |c| c['ingredients'] }
                            .uniq
                            .map { |name| { name: name } }
Ingredient.create(ingredients)


p "--- Creating categories"
ingredients = cocktails_list.map { |c| { name: c['category'] } }
                            .uniq
Category.create(ingredients)

# cocktails_list.each do |cocktail|
#   # Cocktail.create ...
# end
