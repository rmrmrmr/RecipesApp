class Food < ApplicationRecord
  validates :price, :quantity, numericality: { greater_than: 0 }
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id'
  has_many :recipes, through: :recipe_foods, class_name: 'Recipe'
  belongs_to :user, class_name: 'User'
end
