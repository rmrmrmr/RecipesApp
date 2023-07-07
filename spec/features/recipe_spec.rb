# spec/features/recipe_list_spec.rb
require 'rails_helper'

RSpec.feature 'Recipe List', type: :feature do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  scenario 'User views recipe list' do
    recipe1 = Recipe.create(name: 'Pasta', description: 'Delicious pasta recipe', user: user)
    recipe2 = Recipe.create(name: 'Pizza', description: 'Homemade pizza recipe', user: user)

    visit recipes_path

    expect(page).to have_content('My Recipes')

    within '.w-5/6.flex.justify-end.mt-10' do
      expect(page).to have_link('New Recipe', href: new_recipe_path)
    end

    within '.flex.flex-col.gap-4.w-full.items-center.text-slate-700' do
      expect(page).to have_link(recipe1.name, href: recipe_path(recipe1))
      expect(page).to have_link(recipe2.name, href: recipe_path(recipe2))
      expect(page).to have_button('Remove', count: 2)

      within "#recipe-#{recipe1.id}" do
        expect(page).to have_content(recipe1.description)
      end

      within "#recipe-#{recipe2.id}" do
        expect(page).to have_content(recipe2.description)
      end
    end
  end

  scenario 'User removes a recipe from the list' do
    recipe = Recipe.create(name: 'Pasta', description: 'Delicious pasta recipe', user: user)

    visit recipes_path

    within "#recipe-#{recipe.id}" do
      expect(page).to have_content(recipe.name)
      click_button 'Remove'
    end

    expect(page).not_to have_content(recipe.name)
    expect(page).not_to have_content(recipe.description)
    expect(page).not_to have_button('Remove')
  end
end
