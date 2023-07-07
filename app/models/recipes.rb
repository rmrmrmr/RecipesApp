class Recipes < ApplicationRecord
  belongs_to :user

  has_many :recipefoods, class_name: 'RecipeFood', foreign_key: 'recipe_id'
  has_many :foods, through: :recipefoods, class_name: 'Food'
end
