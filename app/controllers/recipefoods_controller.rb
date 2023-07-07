class RecipefoodsController < ApplicationController
  def new
    @user = current_user.name
    @recipe = Recipes.find(params[:recipe_id])
    @recipefood = Recipefood.new
    @foods = current_user.foods.includes(:user)
    respond_to do |format|
      format.html { render :new, locals: { recipefood: @recipefood } }
    end
  end

  def create
    @recipefood = Recipefood.new(recipefood_params)
    @recipefood.recipes_id = Recipes.find(params[:recipe_id]).id
    respond_to do |format|
      format.html do
        if @recipefood.save
          redirect_to recipe_path(params[:recipe_id])
        else
          flash.now[:error] = 'Could not add ingredient to recipe'
          render :new, locals: { recipefood: @recipefood }
        end
      end
    end
  end

  def recipefood_params
    params.require(:recipefood).permit(:quantity, :foods_id, :recipes_id)
  end
end
