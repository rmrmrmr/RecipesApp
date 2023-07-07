# spec/features/public_recipe_spec.rb
require 'rails_helper'

RSpec.feature 'Public Recipe', type: :feature do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'Apple Pie', description: 'Delicious apple pie recipe', public: true, user:) }

  scenario 'User views public recipe details' do
    visit public_recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)
    expect(page).to have_link('Edit Recipe', href: edit_recipe_path(recipe))
    expect(page).to have_button('Make Private')
  end

  scenario 'Owner views private recipe details' do
    recipe.update(public: false)

    login_as(user, scope: :user)
    visit public_recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)
    expect(page).to have_link('Edit Recipe', href: edit_recipe_path(recipe))
    expect(page).to have_button('Make Public')
  end

  scenario 'Guest views private recipe details' do
    recipe.update(public: false)

    visit public_recipe_path(recipe)

    expect(page).to have_content('Recipe not found')
    expect(page).not_to have_content(recipe.name)
    expect(page).not_to have_content(recipe.description)
    expect(page).not_to have_link('Edit Recipe')
    expect(page).not_to have_button('Make Public')
  end
end
