class RecipesController < ApplicationController
  def index
    @user = current_user.name
  end

  def new
    @user = current_user.name
    @recipe = Recipes.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end

  def create
    @recipe = Recipes.new(recipe_params)
    @recipe.user = current_user
    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_path
        else
          flash.now[:error] = 'Error: could not save recipe'
          render :new, locals: { recipe: @recipe }
        end
      end
    end
  end

  def show; end

  def destroy; end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
