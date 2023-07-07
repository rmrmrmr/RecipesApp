class ShoppinglistController < ApplicationController
  def general_shopping_list
    @user = current_user.name
    @recipes = Recipe.find(params[:recipe_id])
    @general_food_list = current_user.foods
  
    # Find the missing food items for all recipes
    @missing_foods = @recipes.foods
  
    # Calculate the total count and price of the missing food
    @total_missing_count = @missing_foods.count
    @total_missing_price = @missing_foods.sum(&:price)
  
    render 'shoppinglist/index'
  end  
end