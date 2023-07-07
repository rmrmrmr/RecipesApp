class Shoppinglist < ApplicationRecord
  belongs_to :user
  has_many :recipefoods
end
