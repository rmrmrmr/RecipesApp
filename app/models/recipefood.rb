class Recipefood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipes', foreign_key: 'recipe_id'
  belongs_to :food, class_name: 'Food', foreign_key: 'food_id'
end
