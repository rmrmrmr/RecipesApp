class Recipefood < ApplicationRecord
  belongs_to :food
  belongs_to :recipes
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :recipes_id, presence: true
  validates :foods_id, presence: true
end
