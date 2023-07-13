class PublicrecipesController < ApplicationController
  def index
    @user = current_user.name
    @recipes = Recipes.where(public: true)
  end
end
