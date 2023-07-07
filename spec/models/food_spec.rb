# spec/models/food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe 'associations' do
    it { should have_many(:recipe_foods).class_name('RecipeFood').with_foreign_key('food_id') }
    it { should belong_to(:user).class_name('User') }
  end
end
