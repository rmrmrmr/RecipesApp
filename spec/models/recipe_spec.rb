# spec/models/recipe_spec.rb
require 'rails_helper'

RSpec.describe Recipes, type: :model do
  subject do
    Recipes.new(name: 'recipe', preparation_time: 10, cooking_time: 10, description: 'recipe description', public: true,
                user_id: 1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'preparation time should be an integer' do
    subject.preparation_time = 1.5
    expect(subject).to_not be_valid
  end

  it 'preparation time should be greater than 0' do
    subject.preparation_time = 0
    expect(subject).to_not be_valid
  end

  it 'cooking time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should be an integer' do
    subject.cooking_time = 1.5
    expect(subject).to_not be_valid
  end

  it 'cooking time should be greater than 0' do
    subject.cooking_time = 0
    expect(subject).to_not be_valid
  end

  it 'validates presence of description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
