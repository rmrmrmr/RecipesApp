class Recipes < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :destroy, foreign_key: 'recipe_id'
  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :description, presence: true
  validates :user_id, presence: true
end
