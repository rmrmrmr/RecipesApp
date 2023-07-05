class RecipesController < ApplicationController
  def index
    @user = current_user.name
  end

  def new
    @user = current_user.name
  end

  def create; end

  def show; end

  def destroy; end
end
