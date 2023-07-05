class FoodsController < ApplicationController
  def index
    @user = current_user.name
  end

  def new; end

  def create; end

  def destroy; end
end
