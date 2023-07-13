Rails.application.routes.draw do
  devise_for :users
  root "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :update, :show, :destroy] do
    resources :recipefoods, only: [:new, :create, :update, :destroy]
  end
  resources :publicrecipes, only: [:index]
  resources :shoppinglist, only: [:index]

  get '/general_shopping_list', to: 'shoppinglist#general_shopping_list'
end