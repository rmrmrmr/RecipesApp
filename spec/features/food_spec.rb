# spec/features/food_list_spec.rb
require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  before do
    login_as(user, scope: :user)
    create_food_items(user)
  end

  scenario 'User views the food list' do
    visit foods_path

    expect(page).to have_content('Foods List')
    expect(page).to have_button('Add Food')
    expect(page).to have_button('Logout')

    within('.table-content') do
      expect(page).to have_selector('tr', count: user.foods.count)
      user.foods.each do |food|
        expect(page).to have_content(food.name)
        expect(page).to have_content(food.measurement_unit)
        expect(page).to have_content(food.price)
        expect(page).to have_content(food.quantity)
      end
    end
  end

  def create_food_items(user)
    user.foods.create(name: 'Apple', measurement_unit: 'Piece', price: 1.99, quantity: 5)
    user.foods.create(name: 'Banana', measurement_unit: 'Piece', price: 0.99, quantity: 3)
    # Add more food items as needed
  end
end
