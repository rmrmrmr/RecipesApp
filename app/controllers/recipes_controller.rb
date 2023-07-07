class RecipesController < ApplicationController
  authorize_resource

  def index
    @user = current_user.name
    @recipes = Recipes.where(user: current_user)
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

  def update
    @recipe = Recipes.find(params[:id])
    respond_to do |format|
      format.html do
        if @recipe.update(recipe_params)
          format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        else
          format.html { render :index, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
    @user = current_user.name
    @recipe = Recipes.find(params[:id])
    @foods = Recipefood.where(recipes_id: params[:id])
    @canupdate = current_user.id == @recipe.user_id
    @ingredients = []
    @foods.each do |food|
      @ing = Food.find(food.foods_id)
      val = @ing.price * food.quantity
      values = { 'id' => food.id, 'name' => @ing.name, 'quantity' => food.quantity, 'unit' => @ing.measurement_unit,
                 'value' => val }
      @ingredients << values
    end
  end

  def destroy
    @recipe = Recipes.find(params[:id])
    respond_to do |f|
      f.html do
        if @recipe.destroy
          redirect_to recipes_path
        else
          flash.now[:error] = 'Could not delete recipe'
          render :index
        end
      end
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
