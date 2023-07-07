# spec/features/shopping_list_spec.rb
require 'rails_helper'

RSpec.feature 'Shopping List', type: :feature do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  scenario 'User views shopping list' do
    food1 = Food.create(name: 'Apple', quantity: 5, price: 1.99, user:)
    food2 = Food.create(name: 'Banana', quantity: 3, price: 0.99, user:)
    total_missing_count = 2
    total_missing_price = 10.93

    visit shopping_list_path

    expect(page).to have_content('Shopping List')
    expect(page).to have_content("Total Missing Food Items: #{total_missing_count}")
    expect(page).to have_content("Total Missing Food Price: $#{total_missing_price}")

    within '.table-container' do
      expect(page).to have_selector('table.food-table')
      expect(page).to have_selector('th.food-header', count: 3)
      expect(page).to have_selector('tbody.table-content')

      within 'tbody.table-content' do
        expect(page).to have_selector('tr', count: 2)

        within 'tr:nth-child(1)' do
          expect(page).to have_content(food1.name)
          expect(page).to have_content(food1.quantity)
          expect(page).to have_content(food1.price)
        end

        within 'tr:nth-child(2)' do
          expect(page).to have_content(food2.name)
          expect(page).to have_content(food2.quantity)
          expect(page).to have_content(food2.price)
        end
      end
    end
  end
end
