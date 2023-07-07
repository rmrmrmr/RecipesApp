class ShoppinglistController < ApplicationController
  def index
    @user = current_user.name
  end
end
