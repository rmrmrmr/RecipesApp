class ShoppinglistController < ApplicationController
  def general_shopping_list
    @user = current_user.name
    @recipes = current_user.recipes.includes(:foods)
    @general_food_list = current_user.foods
  
    # Find the missing food items for all recipes
    @missing_foods = @recipes.map { |recipe| recipe.foods }.flatten.uniq - @general_food_list
  
    # Calculate the total count and price of the missing food
    @total_missing_count = @missing_foods.count
    @total_missing_price = @missing_foods.sum(&:price)
  
    render 'shoppinglist/index'
  end  
end