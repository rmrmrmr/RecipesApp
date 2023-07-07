# spec/models/shoppinglist_spec.rb
require 'rails_helper'

RSpec.describe Shoppinglist, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipefoods) }
  end
end
